from django.db.models import Prefetch
from rest_framework import viewsets

from api.serializers import ConsultantSerializer, CompanySerializer, \
    ConsultantScheduleSerializer
from core.models import Consultant, Company, ConsultantSchedule


class ConsultantViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows consultants to be viewed or edited.
    """
    queryset = Consultant.objects.filter(is_active=True)
    serializer_class = ConsultantSerializer
    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]


class CompanyViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows companies to be viewed or edited.
    """
    serializer_class = CompanySerializer

    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]

    def get_queryset(self):
        companies = Company.objects.prefetch_related(
            Prefetch('consultants', queryset=Consultant.objects.filter(is_active=True))
        ).filter(consultants__isnull=False)
        return companies


class ConsultantScheduleViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows consultant schedule to be viewed or edited.
    """
    queryset = ConsultantSchedule.objects.filter()
    serializer_class = ConsultantScheduleSerializer
    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]
