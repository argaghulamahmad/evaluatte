from django.db.models import Prefetch, Q
from rest_framework import mixins, viewsets
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from api.serializers import ConsultantSerializer, CompanySerializer, ConsultantScheduleSerializer, TestimonialSerializer
from core.models import Consultant, Company, ConsultantSchedule, Meet


class FetchViewSet(mixins.RetrieveModelMixin, mixins.ListModelMixin, GenericViewSet):
    pass


class ConsultantViewSet(FetchViewSet):
    queryset = Consultant.objects.filter(is_active=True)
    serializer_class = ConsultantSerializer

    def get_queryset(self):
        query = """
            select cc.full_name, ccs.id, ccs.is_booked
             from core_consultant cc
                      left join core_consultant_schedule ccs on cc.id = ccs.consultant_id
             where ccs.is_booked is not True
        """

        consultants = (Consultant.objects.raw(query))

        return consultants


class CompanyViewSet(FetchViewSet):
    serializer_class = CompanySerializer

    def get_queryset(self):
        companies = Company.objects.prefetch_related(
            Prefetch('consultants', queryset=Consultant.objects.filter(is_active=True))
        ).filter(consultants__isnull=False).distinct('name')
        return companies


class ConsultantScheduleViewSet(viewsets.ViewSet):
    serializer_class = ConsultantScheduleSerializer

    @staticmethod
    def list(request, *args, **kwargs):
        queryset = ConsultantSchedule.objects.filter(consultant_id=kwargs['consultant_id'], is_booked=False)
        serializer = ConsultantScheduleSerializer(queryset, many=True)
        return Response(serializer.data)


class TestimonialViewSet(FetchViewSet):
    serializer_class = TestimonialSerializer

    def get_queryset(self):
        testimonials = Meet.objects.filter(show_testimony=True).order_by('-id')[:5]
        return testimonials
