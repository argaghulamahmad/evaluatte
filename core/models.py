from django.db import models


class TeamMember(models.Model):
    full_name = models.CharField(max_length=254)
    position = models.CharField(max_length=254)


class Consultant(models.Model):
    full_name = models.CharField(max_length=254)
    role = models.CharField(max_length=254)
    company = models.CharField(max_length=254)
    email = models.EmailField(max_length=254)
    linkedin_profile = models.CharField(max_length=254)
    phone_number = models.CharField(max_length=254)
    is_active = models.BooleanField()
    price = models.DecimalField(max_digits=100, decimal_places=2)
    experience = models.TextField()
    note = models.TextField(null=True, blank=True)
