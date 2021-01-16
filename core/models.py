from django.db import models


class TeamMember(models.Model):
    full_name = models.CharField(max_length=100)
    position = models.CharField(max_length=100)


class Consultant(models.Model):
    full_name = models.CharField(max_length=100)
    role = models.CharField(max_length=100)
    company = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    linkedin_profile = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=100)
    is_active = models.BooleanField()
    price = models.CharField(max_length=100)
    experience = models.TextField()
    note = models.TextField()
