from django.db import models


class TeamMember(models.Model):
    profile_image = models.CharField(max_length=254)
    full_name = models.CharField(max_length=254)
    position = models.CharField(max_length=254)
    is_show = models.BooleanField(null=True, blank=True)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    instagram_profile = models.CharField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'core_teammember'

    def __str__(self):
        return self.full_name + ' | ' + self.position


class Consultant(models.Model):
    profile_image = models.CharField(max_length=254)
    full_name = models.CharField(null=True, blank=True, max_length=254)
    role = models.CharField(null=True, blank=True, max_length=254)
    company = models.CharField(null=True, blank=True, max_length=254)
    email = models.EmailField(null=True, blank=True, max_length=254)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    phone_number = models.CharField(null=True, blank=True, max_length=254)

    is_active = models.BooleanField(null=True, blank=True)

    is_cv = models.BooleanField(null=True, blank=True)
    is_interview = models.BooleanField(null=True, blank=True)
    cv_price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    interview_price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    experience = models.TextField(null=True, blank=True)
    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_consultant'

    def __str__(self):
        return self.full_name + ' - ' + self.role + ' at ' + self.company


class Client(models.Model):
    full_name = models.CharField(max_length=254)
    profile_image = models.CharField(null=True, blank=True, max_length=254)
    title = models.CharField(max_length=254)
    cv_url = models.CharField(null=True, blank=True, max_length=254)
    email = models.EmailField(max_length=254)
    phone_number = models.CharField(max_length=254)
    linkedin_profile = models.CharField(null=True, blank=True, max_length=254)
    instagram_profile = models.CharField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'core_client'

    def __str__(self):
        return self.full_name + ' - ' + self.email + ' - ' + self.phone_number + ' - ' + self.title


class Meet(models.Model):
    MEET_TYPES = (
        ('INTERVIEW', 'Interview'),
        ('CV', 'CV'),
    )

    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING)
    client = models.ForeignKey(Client, on_delete=models.DO_NOTHING)
    type = models.CharField(null=True, blank=True, max_length=254, choices=MEET_TYPES)

    datetime = models.DateTimeField()
    meet_url = models.CharField(null=True, blank=True, max_length=254)
    is_complete = models.BooleanField(default=False)

    testimony = models.TextField(null=True, blank=True)
    testimony_proof = models.CharField(null=True, blank=True, max_length=254)
    show_testimony = models.BooleanField(default=False)

    rating = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    show_rating = models.BooleanField(default=False)

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet'

    def __str__(self):
        return self.consultant.full_name + ' - ' + self.client.full_name + ' - ' + self.datetime.strftime("%m/%d/%Y, "
                                                                                                          "%H:%M:%S")
