from rest_framework import serializers

from core.models import Consultant, Company, ConsultantSchedule, Meet, Client


class ConsultantScheduleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ConsultantSchedule
        fields = ['formatted_date', 'formatted_start_time', 'formatted_end_time']


class ClientSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Client
        fields = [
            'id',

            'full_name', 'profile_image', 'title'
        ]


class ConsultantSerializer(serializers.HyperlinkedModelSerializer):
    company_name = serializers.CharField(source='company.name')

    consultant_schedules = ConsultantScheduleSerializer(many=True)

    class Meta:
        model = Consultant
        fields = [
            'id',

            'profile_image', 'full_name', 'role', 'company_name', 'industry', 'year_of_experience',

            'is_cv',
            'is_interview',

            'is_active',

            'cv_price',
            'interview_price',

            'rating',

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
        fields = ['formatted_date', 'formatted_start_time', 'formatted_end_time', 'consultant']


class TestimonialSerializer(serializers.HyperlinkedModelSerializer):
    client = ClientSerializer(required=True)

    class Meta:
        model = Meet
        fields = ['testimony', 'client']
