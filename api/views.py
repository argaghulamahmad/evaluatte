from rest_framework.decorators import api_view
from rest_framework.response import Response


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

    # todo create new row object and save using django - client
    # todo create new row object and save using django - meet

    return Response({"message": "Got some data!", "data": request.data})
