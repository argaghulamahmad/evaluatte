import hashlib
import hmac
import logging
from datetime import date
from decimal import Decimal, InvalidOperation

import midtransclient
from django.db import transaction
from django.db.models import Q
from django.utils import timezone
from django.utils.crypto import get_random_string
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.conf import settings
from core.models import OrderLog, MidtransLog, Client, Meet, Consultant, ConsultantSchedule

logger = logging.getLogger('api-views')

# Price is always read from the consultant record, never from the request.
PRICE_FIELD_BY_TYPE = {'CV': 'cv_price', 'INTERVIEW': 'interview_price'}
OFFER_FLAG_BY_TYPE = {'CV': 'is_cv', 'INTERVIEW': 'is_interview'}

ORDER_REQUIRED_FIELDS = (
    'clientEmail', 'clientName', 'clientPhoneNumber', 'clientProblem',
    'clientResumeUrl', 'consultantId', 'consultantScheduleId', 'consultantType',
)

# Midtrans statuses after which the reserved schedule must be released again.
RELEASE_STATUSES = ('expire', 'cancel', 'deny', 'failure')


class OrderRejected(Exception):
    """Business-rule rejection raised inside the atomic block so nothing is persisted."""

    def __init__(self, message, http_status):
        super().__init__(message)
        self.message = message
        self.http_status = http_status


def _error(message, http_status):
    return Response({"success": False, "message": message}, status=http_status)


def create_order_and_payment_link(data, consultant_id, consultant_schedule_id, consultant_type,
                                  price_field, offer_flag):
    consultant = (
        Consultant.objects.select_for_update()
        .filter(id=consultant_id, is_active=True, **{offer_flag: True})
        .first()
    )
    if consultant is None:
        raise OrderRejected("Konsultan tidak tersedia untuk tipe konsultasi ini!", status.HTTP_400_BAD_REQUEST)

    schedule = (
        ConsultantSchedule.objects.select_for_update()
        .filter(id=consultant_schedule_id, consultant_id=consultant.id)
        .first()
    )
    if schedule is None:
        raise OrderRejected("Jadwal konsultasi tidak ditemukan!", status.HTTP_400_BAD_REQUEST)
    if schedule.start_date < timezone.localdate():
        raise OrderRejected("Jadwal konsultasi sudah lewat!", status.HTTP_400_BAD_REQUEST)
    if schedule.is_booked:
        raise OrderRejected("Maaf, jadwal ini sudah dipesan. Silahkan pilih jadwal lain!", status.HTTP_409_CONFLICT)

    client_email = str(data['clientEmail'])
    client_phone_number = str(data['clientPhoneNumber'])
    if not is_previous_payment_finished(client_email, client_phone_number):
        raise OrderRejected("Silahkan selesaikan pembayaran order sebelumnya terlebih dahulu!",
                            status.HTTP_409_CONFLICT)

    # Price comes from the consultant record. Client-supplied amounts are never trusted.
    price = getattr(consultant, price_field)
    if price is None:
        raise OrderRejected("Harga konsultasi belum tersedia!", status.HTTP_400_BAD_REQUEST)

    unique_code = get_random_string(10) + '-' + date.today().strftime("%m%d%Y")
    order_id = f"evaluatte-{consultant_type}-{unique_code}"

    order_log = OrderLog.objects.create(
        order_id=order_id,
        unique_code=unique_code,

        client_email=client_email,
        client_name=str(data['clientName']),
        client_phone_number=client_phone_number,
        client_problem=str(data['clientProblem']),
        client_resume_url=str(data['clientResumeUrl']),
        consultant_id=consultant.id,
        consultant_name=consultant.full_name,
        consultant_price=price,
        consultant_schedule_id=schedule.id,
        consultant_type=consultant_type,
    )

    schedule.is_booked = True
    schedule.save(update_fields=['is_booked', 'modified'])

    snap = midtransclient.Snap(
        is_production=settings.MIDTRANS_IS_PRODUCTION,
        server_key=settings.MIDTRANS_SERVER_KEY
    )
    transaction_result = snap.create_transaction(build_snap_param(order_log, schedule))
    return transaction_result, order_id


@api_view(['POST'])
def order(request):
    data = request.data

    missing = [field for field in ORDER_REQUIRED_FIELDS if not data.get(field)]
    if missing:
        logger.info('order rejected: missing fields %s', missing)
        return _error("Pastikan semua data yang dimasukkan sudah benar!", status.HTTP_400_BAD_REQUEST)

    consultant_type = str(data['consultantType'])
    price_field = PRICE_FIELD_BY_TYPE.get(consultant_type)
    offer_flag = OFFER_FLAG_BY_TYPE.get(consultant_type)
    if price_field is None:
        return _error("Pastikan semua data yang dimasukkan sudah benar!", status.HTTP_400_BAD_REQUEST)

    try:
        consultant_id = int(data['consultantId'])
        consultant_schedule_id = int(data['consultantScheduleId'])
    except (TypeError, ValueError):
        return _error("Pastikan semua data yang dimasukkan sudah benar!", status.HTTP_400_BAD_REQUEST)

    try:
        with transaction.atomic():
            transaction_result, order_id = create_order_and_payment_link(
                data, consultant_id, consultant_schedule_id, consultant_type, price_field, offer_flag,
            )
    except OrderRejected as rejected:
        return _error(rejected.message, rejected.http_status)
    except Exception:
        # Raised inside the atomic block, so the booking and order log were rolled back.
        logger.exception('order create failed, consultant_schedule_id=%s', consultant_schedule_id)
        return _error("Oops, Ada kesalahan di dalam sistem kami. Silahkan coba lagi nanti!",
                      status.HTTP_502_BAD_GATEWAY)

    logger.info('order created order_id=%s', order_id)
    return Response({
        "success": True,
        "message": "Success create new order log and payment link!",
        "data": {
            "transaction_token": transaction_result['token'],
            "transaction_redirect_url": transaction_result['redirect_url'],
        }
    })


def build_snap_param(order_log, schedule):
    first_name, _, last_name = order_log.client_name.partition(" ")

    return {
        "transaction_details": {
            "order_id": order_log.order_id,
            # IDR has no minor unit; Midtrans expects an integer amount.
            "gross_amount": int(order_log.consultant_price),
        },
        "credit_card": {
            "secure": True
        },
        "item_details": [
            {
                "id": str(schedule.id),
                "price": int(order_log.consultant_price),
                "quantity": 1,
                "name": f'Konsultasi {order_log.consultant_type}',
            }
        ],
        "customer_details": {
            "first_name": first_name,
            "last_name": last_name,
            "email": order_log.client_email,
            "phone": order_log.client_phone_number
        }
    }


def is_previous_payment_finished(client_email, client_phone_number):
    last_order = (
        OrderLog.objects
        .filter(Q(client_email=client_email) | Q(client_phone_number=client_phone_number))
        .order_by('-id')
        .first()
    )
    if last_order is None:
        return True

    last_midtrans_log = (
        MidtransLog.objects
        .filter(order_id=last_order.order_id)
        .order_by('-id')
        .first()
    )
    if last_midtrans_log is None:
        return True

    return last_midtrans_log.transaction_status in ('settlement', 'expire')


def is_valid_midtrans_signature(order_id, status_code, gross_amount, signature_key):
    # Midtrans: SHA512(order_id + status_code + gross_amount + ServerKey)
    expected = hashlib.sha512(
        f'{order_id}{status_code}{gross_amount}{settings.MIDTRANS_SERVER_KEY}'.encode('utf-8')
    ).hexdigest()
    return hmac.compare_digest(expected, str(signature_key))


@api_view(['POST'])
def order_webhook(request):
    data = request.data

    try:
        transaction_time = data['transaction_time']
        transaction_status = data['transaction_status']
        transaction_id = data['transaction_id']
        status_message = data['status_message']
        status_code = data['status_code']
        signature_key = data['signature_key']
        payment_type = data['payment_type']
        order_id = data['order_id']
        merchant_id = data['merchant_id']
        gross_amount = data['gross_amount']
        currency = data['currency']
    except KeyError as exp:
        logger.warning('webhook rejected: missing field %s', exp)
        return _error("Payload webhook tidak lengkap!", status.HTTP_400_BAD_REQUEST)

    if not is_valid_midtrans_signature(order_id, status_code, gross_amount, signature_key):
        logger.warning('webhook rejected: invalid signature, order_id=%s', order_id)
        return _error("Invalid signature!", status.HTTP_403_FORBIDDEN)

    midtrans_fields = {
        'transaction_time': transaction_time,
        'transaction_id': transaction_id,
        'status_message': status_message,
        'status_code': status_code,
        'signature_key': signature_key,
        'payment_type': payment_type,
        'merchant_id': merchant_id,
        'gross_amount': gross_amount,
        'currency': currency,
    }

    with transaction.atomic():
        order_log = OrderLog.objects.select_for_update().filter(order_id=order_id).first()
        if order_log is None:
            logger.error('webhook for unknown order_id=%s, status=%s', order_id, transaction_status)
            return _error("Order tidak ditemukan!", status.HTTP_404_NOT_FOUND)

        midtrans_log, _ = MidtransLog.objects.get_or_create(
            transaction_id=transaction_id,
            order_id=order_id,
            transaction_status=transaction_status,
            defaults=midtrans_fields,
        )

        if transaction_status == 'settlement':
            return handle_settle_payment(order_log, midtrans_log, gross_amount)

        if transaction_status in RELEASE_STATUSES:
            return handle_release_schedule(order_log, transaction_status)

        logger.info('webhook noop order_id=%s status=%s', order_id, transaction_status)
        return Response({"success": True, "message": "Status tidak memerlukan tindakan."})


def handle_release_schedule(order_log, transaction_status):
    if is_order_settled(order_log.order_id):
        logger.warning('release ignored, order already settled order_id=%s status=%s',
                       order_log.order_id, transaction_status)
        return Response({"success": True, "message": "Order sudah lunas, jadwal tidak dilepas."})

    schedule = ConsultantSchedule.objects.select_for_update().filter(id=order_log.consultant_schedule_id).first()
    if schedule is not None and schedule.is_booked:
        schedule.is_booked = False
        schedule.save(update_fields=['is_booked', 'modified'])

    logger.info('schedule released order_id=%s status=%s', order_log.order_id, transaction_status)
    return Response({"success": True, "message": f"Jadwal dilepas karena status {transaction_status}."})


def is_order_settled(order_id):
    return Meet.objects.filter(payment_proof__order_id=order_id, is_paid=True).exists()


def handle_settle_payment(order_log, midtrans_log, gross_amount):
    try:
        paid_amount = Decimal(str(gross_amount))
    except (InvalidOperation, TypeError):
        paid_amount = None

    if paid_amount is None or paid_amount != order_log.consultant_price:
        # Money moved but does not match the order. Do not create a Meet; needs manual review.
        logger.error('settlement amount mismatch order_id=%s expected=%s got=%s',
                     order_log.order_id, order_log.consultant_price, gross_amount)
        return Response({"success": False, "message": "Nominal pembayaran tidak sesuai."},
                        status=status.HTTP_200_OK)

    # Idempotent: Midtrans retries webhooks, so a Meet already linked to this payment means nothing to do.
    if Meet.objects.filter(payment_proof=midtrans_log).exists():
        return Response({"success": True, "message": "Pembayaran sudah diproses sebelumnya."})

    client = Client.objects.filter(email=order_log.client_email).first()
    if client is None:
        client = Client.objects.create(
            full_name=order_log.client_name,
            email=order_log.client_email,
            cv_url=order_log.client_resume_url,
            phone_number=order_log.client_phone_number,
        )
    else:
        client.phone_number = order_log.client_phone_number
        client.cv_url = order_log.client_resume_url
        client.save()

    schedule = ConsultantSchedule.objects.select_for_update().get(id=order_log.consultant_schedule_id)
    schedule.is_booked = True
    schedule.save(update_fields=['is_booked', 'modified'])

    Meet.objects.create(
        consultant_id=order_log.consultant_id,
        client_id=client.id,
        client_problem=order_log.client_problem,
        type=order_log.consultant_type,
        price=order_log.consultant_price,
        payment_proof=midtrans_log,
        is_paid=True,
        start_date=schedule.start_date,
        start_time=schedule.start_time,
        end_time=schedule.end_time,
    )

    logger.info('payment settled order_id=%s', order_log.order_id)
    return Response({"success": True, "message": "Success create new payment log and meet!"})
