from rest_framework.decorators import api_view
from rest_framework.response import Response

from core.models import OrderLog


@api_view(['POST'])
def order(request):
    """
    Example of the post data body:
    {
        clientEmail: "test@gmail.com"
        clientName: "test"
        clientPhoneNumber: "0888888"
        clientProblem: "asasas"
        clientResumeUrl: "https://evaluatte-system.s3.amazonaws.com/CV/776-1613658265272.jpg.jpeg"
        consultantId: 1
        consultantName: "Teguh Priyantono"
        consultantPrice: "75000.00"
        consultantScheduleId: 2
        consultantType: "CV"
    }
    """

    client_email = request.data.clientEmail
    client_name = request.data.clientName
    client_phone_number = request.data.clientPhoneNumber
    client_problem = request.data.clientProblem
    client_resume_url = request.data.clientResumeUrl
    consultant_id = request.data.consultantId
    consultant_name = request.data.consultantName
    consultant_price = request.data.consultantPrice
    consultant_schedule_id = request.data.consultantScheduleId
    consultant_type = request.data.consultantType

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

    # todo create new row object and save using django - client
    # todo create new row object and save using django - meet

    return Response({"message": "Got some data!", "data": request.data})
