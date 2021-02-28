from django.db.models import Prefetch
from rest_framework import mixins
from rest_framework.viewsets import GenericViewSet

from api.serializers import ConsultantSerializer, CompanySerializer, \
    ConsultantScheduleSerializer
from core.models import Consultant, Company, ConsultantSchedule


class FetchViewSet(mixins.RetrieveModelMixin, mixins.ListModelMixin, GenericViewSet):
    pass


class ConsultantViewSet(FetchViewSet):
    """
    API endpoint that allows consultants to be viewed or edited.
    """
    queryset = Consultant.objects.filter(is_active=True)
    serializer_class = ConsultantSerializer


class CompanyViewSet(FetchViewSet):
    """
    API endpoint that allows companies to be viewed or edited.
    """
    serializer_class = CompanySerializer

    def get_queryset(self):
        companies = Company.objects.prefetch_related(
            Prefetch('consultants', queryset=Consultant.objects.filter(is_active=True))
        ).filter(consultants__isnull=False).distinct('name')
        return companies


class ConsultantScheduleViewSet(FetchViewSet):
    """
    API endpoint that allows consultant schedule to be viewed or edited.
    """
    queryset = ConsultantSchedule.objects.filter()
    serializer_class = ConsultantScheduleSerializer
