from django.contrib.auth.models import User, Group
from rest_framework import serializers

from core.models import Consultant, Company


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class ConsultantSerializer(serializers.HyperlinkedModelSerializer):
    company_name = serializers.CharField(source='company.name')

    class Meta:
        model = Consultant
        fields = ['profile_image', 'full_name', 'role', 'company_name']


class CompanySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Company
        fields = ['name', 'industry']
