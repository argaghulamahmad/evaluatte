from django.db.models import Prefetch
from rest_framework import mixins, viewsets
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from api.serializers import ConsultantSerializer, CompanySerializer, ConsultantScheduleSerializer
from core.models import Consultant, Company, ConsultantSchedule


class FetchViewSet(mixins.RetrieveModelMixin, mixins.ListModelMixin, GenericViewSet):
    pass


class ConsultantViewSet(FetchViewSet):
    queryset = Consultant.objects.filter(is_active=True)
    serializer_class = ConsultantSerializer


class CompanyViewSet(FetchViewSet):
    serializer_class = CompanySerializer

    def get_queryset(self):
        companies = Company.objects.prefetch_related(
            Prefetch('consultants', queryset=Consultant.objects.filter(is_active=True))
        ).filter(consultants__isnull=False).distinct('name')
        return companies


class ConsultantScheduleViewSet(viewsets.ViewSet):
    @staticmethod
    def list(request, *args, **kwargs):
        queryset = ConsultantSchedule.objects.filter(consultant_id=kwargs['consultant_id'])
        serializer = ConsultantScheduleSerializer(queryset, many=True)
        return Response(serializer.data)
