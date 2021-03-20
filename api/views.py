from datetime import date

import midtransclient
from django.utils.crypto import get_random_string
from rest_framework.decorators import api_view
from rest_framework.response import Response

from core.models import OrderLog, MidtransLog


@api_view(['POST'])
def order(request):
    try:
        unique_code = get_random_string(5) + '-' + date.today().strftime("%m%d%Y")

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

        new_order_log = OrderLog(
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

        snap = midtransclient.Snap(
            is_production=False,
            server_key='SB-Mid-server-AURmn6plVIEOIpFE26Pr2kp0'
        )

        first_name = new_order_log.client_name.split(" ", 1)[0]
        try:
            last_name = new_order_log.client_name.split(" ", 1)[1]
        except IndexError:
            last_name = ''

        param = {
            "transaction_details": {
                "order_id": f"evaluatte-{new_order_log.consultant_type}-{str(new_order_log.unique_code)}",
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
                    "name": f'Konsultasi {str(new_order_log.consultant_type)}'
                }
            ],
            "customer_details": {
                "first_name": first_name,
                "last_name": last_name,
                "email": new_order_log.client_email,
                "phone": new_order_log.client_phone_number
            }
        }

        transaction = snap.create_transaction(param)

        transaction_token = transaction['token']
        transaction_redirect_url = transaction['redirect_url']

        return Response(
            {
                "success": True,
                "message": "Success create new order log and payment link!",
                "data": {
                    "transaction_token": transaction_token,
                    "transaction_redirect_url": transaction_redirect_url
                }
            }
        )
    except Exception as exp:
        return Response(
            {
                "success": False,
                "message": "Failed create new order slog and payment link!",
                "error": str(exp)
            }
        )


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

        new_midtrans_log = MidtransLog(
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
        new_midtrans_log.save()

        return Response(
            {
                "success": True,
                "message": "Success create new payment log and meet!",
            }
        )
    except Exception as exp:
        return Response(
            {
                "success": False,
                "message": "Failed create new meet!",
                "error": str(exp)
            }
        )
