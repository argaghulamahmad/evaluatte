import midtransclient
from rest_framework.decorators import api_view
from rest_framework.response import Response

from core.models import OrderLog


@api_view(['POST'])
def order(request):
    """
    Example of the post data body:
    {
        clientEmail: "arga@gmail.com"
        clientName: "arga"
        clientPhoneNumber: "087708770877"
        clientProblem: "087708770877"
        clientResumeUrl: "https://evaluatte-system.s3.amazonaws.com/CV/748-1613658265272.jpg.jpeg"
        consultantId: 1
        consultantName: "Teguh Priyantono"
        consultantPrice: "75000.00"
        consultantScheduleId: 1
        consultantType: "CV"
    }
    """

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

        new_order_log = OrderLog(
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
                "order_id": "transaction-" + str(new_order_log.id),
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
        print(exp)

        return Response(
            {
                "success": False,
                "message": "Failed create new order log and payment link!"
            }
        )
