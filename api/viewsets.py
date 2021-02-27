from django.contrib.auth.models import User, Group
from django.db.models import Prefetch
from rest_framework import viewsets

from api.serializers import UserSerializer, GroupSerializer, ConsultantSerializer, CompanySerializer, \
    ConsultantScheduleWithConsultantSerializer
from core.models import Consultant, Company, ConsultantSchedule


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]


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
    serializer_class = ConsultantScheduleWithConsultantSerializer
    # permission_classes = [permissions.IsAuthenticated, HasAPIKey]
