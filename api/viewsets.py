from datetime import datetime, timedelta

from django.db.models import Prefetch
from rest_framework import mixins, viewsets
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from api.serializers import ConsultantSerializer, CompanySerializer, ConsultantScheduleSerializer, TestimonialSerializer
from core.models import Consultant, Company, ConsultantSchedule, Meet


class FetchViewSet(mixins.RetrieveModelMixin, mixins.ListModelMixin, GenericViewSet):
    pass


class ConsultantViewSet(FetchViewSet):
    serializer_class = ConsultantSerializer

    def get_queryset(self):
        consultants = Consultant.objects.filter(is_active=True).prefetch_related(
            Prefetch('consultant_schedules',
                         queryset=ConsultantSchedule.objects.filter(
                             is_booked=False,
                             start_date__gte=datetime.today() + timedelta(days=1),
                             start_date__lt=datetime.today() + timedelta(days=8)
                         )
                     ),
        )
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
