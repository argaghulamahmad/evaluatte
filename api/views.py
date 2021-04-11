import logging
from datetime import date

import midtransclient
from django.db import connection
from django.utils.crypto import get_random_string
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from app import settings
from core.models import OrderLog, MidtransLog, Client, Meet, ConsultantSchedule

logger = logging.getLogger('api-views')


def dict_fetch_all(cursor):
    """Returns all rows from a cursor as a dict"""
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


@api_view(['POST'])
def order(request):
    try:
        # noinspection PyBroadException
        try:
            client_email = request.data['clientEmail']
            client_name = request.data['clientName']
            client_phone_number = request.data['clientPhoneNumber']
            client_problem = request.data['clientProblem']
            client_resume_url = request.data['clientResumeUrl']
            consultant_id = request.data['consultantId']
            consultant_name = request.data['consultantName']
            consultant_price = request.data['consultantPrice']
            consultant_schedule_id = request.data['consultantScheduleId']
            consultant_type = request.data['consultantType']
        except Exception as exp:
            response_data = {
                "success": False,
                "message": "Pastikan semua data yang dimasukkan sudah benar!",
                "param": request.data,
                "error": str(exp)
            }

            logger.info(response_data)

            return Response(
                response_data
            )

        previous_payment_finished = is_previous_payment_finished(client_email, client_phone_number)
        if previous_payment_finished is False:
            client_phone_number_email = client_email + ' ' + client_phone_number
            response_data = {
                "success": False,
                "message": "Silahkan selesaikan pembayaran order sebelumnya terlebih dahulu!",
                "param": client_phone_number_email,
            }

            logger.info(response_data)

            return Response(
                response_data
            )

        unique_code = get_random_string(5) + '-' + date.today().strftime("%m%d%Y")
        order_id = f"evaluatte-{consultant_type}-{str(unique_code)}"

        new_order_log = OrderLog(
            order_id=order_id,
            unique_code=str(unique_code),

            client_email=client_email,
            client_name=client_name,
            client_phone_number=client_phone_number,
            client_problem=client_problem,
            client_resume_url=client_resume_url,
            consultant_id=consultant_id,
            consultant_name=consultant_name,
            consultant_price=consultant_price,
            consultant_schedule_id=consultant_schedule_id,
            consultant_type=consultant_type,
        )
        new_order_log.save()

        consultant_schedule = ConsultantSchedule.objects.get(id=consultant_schedule_id)
        consultant_schedule.is_booked = True
        consultant_schedule.save()

        snap = midtransclient.Snap(
            is_production=True,
            server_key=settings.MIDTRANS_SERVER_KEY
        )

        first_name = new_order_log.client_name.split(" ", 1)[0]
        try:
            last_name = new_order_log.client_name.split(" ", 1)[1]
        except IndexError:
            last_name = ''

        param = {
            "transaction_details": {
                "order_id": order_id,
                "gross_amount": new_order_log.consultant_price
            },
            "credit_card": {
                "secure": True
            },
            "item_details": [
                {
                    "id": str(new_order_log.consultant_schedule_id),
                    "price": new_order_log.consultant_price,
                    "quantity": 1,
                    "name": f'Konsultasi {str(new_order_log.consultant_type)} '
                    # f'w/ {str(new_order_log.consultant_name.split(" ", 1)[0])} '
                    # f'{str(consultant_schedule.formatted_date)} '
                    # f'{str(consultant_schedule.formatted_start_time)} '
                    # f'- {str(consultant_schedule.formatted_end_time)}'
                }
            ],
            "customer_details": {
                "first_name": first_name,
                "last_name": last_name,
                "email": new_order_log.client_email,
                "phone": new_order_log.client_phone_number
            }
        }

        try:
            transaction = snap.create_transaction(param)
        except Exception as exp:
            response_data = {
                "success": False,
                "message": "Oops, Ada kesalahan di dalam sistem kami. Silahkan coba lagi nanti!",
                "param": param,
                "error": str(exp)
            }

            logger.info(response_data)

            return Response(
                response_data
            )

        transaction_token = transaction['token']
        transaction_redirect_url = transaction['redirect_url']

        response_data = {
            "success": True,
            "message": "Success create new order log and payment link!",
            "data": {
                "transaction_token": transaction_token,
                "transaction_redirect_url": transaction_redirect_url
            }
        }

        logger.info(response_data)

        return Response(
            response_data
        )
    except Exception as exp:
        response_data = {
            "success": False,
            "message": "Failed create new order log and payment link!",
            "error": str(exp)
        }

        logger.error(response_data)

        return Response(
            response_data
        )


def is_previous_payment_finished(client_email, client_phone_number):
    with connection.cursor() as cursor:
        last_order_log_by_client_email_phone_number = """
                select client_email, order_id
                    from core_order_log
                    where client_email = %s or client_phone_number = %s
                    order by id desc
                    limit 1;
            """
        cursor.execute(last_order_log_by_client_email_phone_number, [client_email, client_phone_number])
        rows = dict_fetch_all(cursor)
        if not rows:
            return True

        row = rows[0]
        if row is None:
            return True

        order_id = row['order_id']

        last_midtrans_log_by_order_id = """
            select order_id, transaction_status
                from core_midtrans_log
                where order_id = %s
                order by id desc
                limit 1;
        """
        cursor.execute(last_midtrans_log_by_order_id, [order_id])
        rows = dict_fetch_all(cursor)
        if not rows:
            return True

        row = rows[0]
        if row is None:
            return True

        if row:
            transaction_status_ = row['transaction_status']

            if transaction_status_ in ['settlement', 'expired']:
                return True
            else:
                return False


@api_view(['POST'])
def order_webhook(request):
    try:
        transaction_time = request.data['transaction_time']
        transaction_status = request.data['transaction_status']
        transaction_id = request.data['transaction_id']
        store = request.data['store']
        status_message = request.data['status_message']
        status_code = request.data['status_code']
        signature_key = request.data['signature_key']
        payment_type = request.data['payment_type']
        payment_code = request.data['payment_code']
        order_id = request.data['order_id']
        merchant_id = request.data['merchant_id']
        gross_amount = request.data['gross_amount']
        currency = request.data['currency']

        logger.info(request.data)

        if transaction_status == 'settlement':
            return handle_settle_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type,
                                         signature_key, status_code, status_message, store, transaction_id,
                                         transaction_status, transaction_time)

        if transaction_status == 'expire':
            return handle_expire_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type,
                                         signature_key, status_code, status_message, store, transaction_id,
                                         transaction_status, transaction_time)

        if transaction_status != 'settlement':
            return handle_not_settle_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type,
                                             signature_key, status_code, status_message, store, transaction_id,
                                             transaction_status, transaction_time)

    except Exception as exp:
        response_data = {
            "success": False,
            "message": "Failed create new payment log and meet!",
            "error": str(exp)
        }

        print(response_data)
        logger.error(response_data)

        return Response(
            response_data,
            status=status.HTTP_400_BAD_REQUEST
        )


def handle_expire_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type, signature_key,
                          status_code, status_message, store, transaction_id, transaction_status, transaction_time):
    is_midtrans_log_exist = MidtransLog.objects.filter(
        order_id=order_id,
        transaction_status=transaction_status
    ).exists()
    if not is_midtrans_log_exist:
        midtrans_log = MidtransLog(
            transaction_time=transaction_time,
            transaction_status=transaction_status,
            transaction_id=transaction_id,
            store=store,
            status_message=status_message,
            status_code=status_code,
            signature_key=signature_key,
            payment_type=payment_type,
            payment_code=payment_code,
            order_id=order_id,
            merchant_id=merchant_id,
            gross_amount=gross_amount,
            currency=currency
        )
        midtrans_log.save()

    order_log = OrderLog.objects.get(order_id=order_id)

    consultant_schedule_id = order_log.consultant_schedule_id
    consultant_schedule = ConsultantSchedule.objects.get(id=consultant_schedule_id)
    consultant_schedule.is_booked = False
    consultant_schedule.save()

    response_data = {
        "success": True,
        "message": f"Payment with order id {str(order_id)} is expired, set the consultant schedule is booked to false!",
    }

    print(response_data)
    logger.info(response_data)

    return Response(
        response_data,
        status=status.HTTP_200_OK
    )


def handle_not_settle_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type, signature_key,
                              status_code, status_message, store, transaction_id, transaction_status, transaction_time):
    is_midtrans_log_exist = MidtransLog.objects.filter(
        order_id=order_id,
        transaction_status=transaction_status
    ).exists()
    if not is_midtrans_log_exist:
        midtrans_log = MidtransLog(
            transaction_time=transaction_time,
            transaction_status=transaction_status,
            transaction_id=transaction_id,
            store=store,
            status_message=status_message,
            status_code=status_code,
            signature_key=signature_key,
            payment_type=payment_type,
            payment_code=payment_code,
            order_id=order_id,
            merchant_id=merchant_id,
            gross_amount=gross_amount,
            currency=currency
        )
        midtrans_log.save()

    response_data = {
        "success": False,
        "message": "Failed create new meet! Because, transaction_status is not settlement!",
    }

    print(response_data)
    logger.error(response_data)

    return Response(
        response_data,
        status=status.HTTP_200_OK
    )


def handle_settle_payment(currency, gross_amount, merchant_id, order_id, payment_code, payment_type, signature_key,
                          status_code, status_message, store, transaction_id, transaction_status, transaction_time):
    is_midtrans_log_exist = MidtransLog.objects.filter(
        order_id=order_id,
        transaction_status=transaction_status
    ).exists()
    if is_midtrans_log_exist:
        midtrans_log = MidtransLog.objects.get(order_id=order_id, transaction_status=transaction_status)
    else:
        midtrans_log = MidtransLog(
            transaction_time=transaction_time,
            transaction_status=transaction_status,
            transaction_id=transaction_id,
            store=store,
            status_message=status_message,
            status_code=status_code,
            signature_key=signature_key,
            payment_type=payment_type,
            payment_code=payment_code,
            order_id=order_id,
            merchant_id=merchant_id,
            gross_amount=gross_amount,
            currency=currency
        )
        midtrans_log.save()

    order_log = OrderLog.objects.get(order_id=order_id)
    client_email = order_log.client_email
    client_name = order_log.client_name
    client_phone_number = order_log.client_phone_number
    client_problem = order_log.client_problem
    client_resume_url = order_log.client_resume_url
    consultant_type = order_log.consultant_type
    consultant_price = order_log.consultant_price

    is_client_exist = Client.objects.filter(email=client_email).exists()
    if is_client_exist:
        client = Client.objects.get(email=client_email)
        client_id = client.id
        client.phone_number = client_phone_number
        client.cv_url = client_resume_url
        client.save()
    else:
        client = Client(
            full_name=client_name,
            email=client_email,
            cv_url=client_resume_url,
            phone_number=client_phone_number
        )
        client_id = client.id
        client.save()

    consultant_id = order_log.consultant_id
    consultant_schedule_id = order_log.consultant_schedule_id
    consultant_schedule = ConsultantSchedule.objects.get(id=consultant_schedule_id)
    consultant_schedule.is_booked = True
    consultant_schedule.save()

    meet = Meet(consultant_id=consultant_id,
                client_id=client_id,
                client_problem=client_problem,
                type=consultant_type,
                price=consultant_price,
                payment_proof=midtrans_log,
                is_paid=True,
                start_date=consultant_schedule.start_date,
                start_time=consultant_schedule.start_time,
                end_time=consultant_schedule.end_time)
    meet.save()

    response_data = {
        "success": True,
        "message": "Success create new payment log and meet!",
    }

    print(response_data)
    logger.info(response_data)

    return Response(
        response_data,
        status=status.HTTP_200_OK
    )
