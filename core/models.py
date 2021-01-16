from django.db import models


class TeamMember(models.Model):
    profile_image = models.CharField(max_length=254)
    full_name = models.CharField(max_length=254)
    position = models.CharField(max_length=254)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    instagram_profile = models.CharField(null=True, blank=True, max_length=254)


class Consultant(models.Model):
    profile_image = models.CharField(max_length=254)
    full_name = models.CharField(null=True, blank=True, max_length=254)
    role = models.CharField(null=True, blank=True, max_length=254)
    company = models.CharField(null=True, blank=True, max_length=254)
    email = models.EmailField(null=True, blank=True, max_length=254)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    phone_number = models.CharField(null=True, blank=True, max_length=254)
    is_active = models.BooleanField()
    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    experience = models.TextField(null=True, blank=True)
    note = models.TextField(null=True, blank=True)


class Client(models.Model):
    full_name = models.CharField(null=True, blank=True, max_length=254)
    profile_image = models.CharField(null=True, blank=True, max_length=254)
    cv_url = models.CharField(null=True, blank=True, max_length=254)
    email = models.EmailField(null=True, blank=True, max_length=254)
    phone_number = models.CharField(null=True, blank=True, max_length=254)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    instagram_profile = models.CharField(null=True, blank=True, max_length=254)


class Interview(models.Model):
    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING)
    client = models.ForeignKey(Client, on_delete=models.DO_NOTHING)
    consultant_name = models.CharField(null=True, blank=True, max_length=254)
    client_name = models.CharField(null=True, blank=True, max_length=254)
    datetime = models.DateTimeField()
    testimony = models.TextField(null=True, blank=True)
    rating = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    note = models.TextField(null=True, blank=True)
