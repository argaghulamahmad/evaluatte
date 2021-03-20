from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['POST'])
def order(request):
    """
    Example of the post data body:
    {
        "clientEmail": "asas@gmail.com",
        "clientName": "asas",
        "clientPhoneNumber": "0877862323",
        "clientProblem": "test test",
        "clientResumeUrl": "https://evaluatte-system.s3.amazonaws.com/CV/252-1613658265272.jpg.jpeg",
        "consultantId": 1,
        "consultantScheduleId": 1
    }
    """

    request_data = request.data

    client_email = request.data.clientEmail
    client_name = request.data.clientName
    client_phone_number = request.data.clientPhoneNumber
    client_problem = request.data.clientProblem
    client_resume_url = request.data.clientResumeUrl
    consultant_id = request.data.consultantId
    consultant_schedule_id = request.data.consultantScheduleId

    # todo create new row object and save using django - client
    # todo create new row object and save using django - meet

    return Response({"message": "Got some data!", "data": request_data})
