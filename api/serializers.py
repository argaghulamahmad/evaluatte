from django.contrib.auth.models import User, Group
from rest_framework import serializers

from core.models import Consultant, Company, ConsultantSchedule


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class ConsultantScheduleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ConsultantSchedule
        fields = ['start_date', 'end_date', 'start_time', 'end_time']


class ConsultantSerializer(serializers.HyperlinkedModelSerializer):
    company_name = serializers.CharField(source='company.name')

    consultant_schedules = ConsultantScheduleSerializer(many=True)

    class Meta:
        model = Consultant
        fields = [
            'profile_image', 'full_name', 'role', 'company_name', 'industry', 'year_of_experience',

            'is_cv',
            'is_interview',

            'is_active',

            'cv_price',
            'interview_price',

            'consultant_schedules',
            'experience_as_list',
            'job_description_as_list',
            'role_expertise_as_list'
        ]


class CompanySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Company
        fields = ['name', 'industry']


class ConsultantScheduleWithConsultantSerializer(serializers.HyperlinkedModelSerializer):
    consultant = ConsultantSerializer(required=True)

    class Meta:
        model = ConsultantSchedule
        fields = ['start_date', 'end_date', 'start_time', 'end_time', 'consultant']
