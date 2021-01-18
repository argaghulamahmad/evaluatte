from django.db import models
from django.utils import timezone


class ModelWithAutoTimestamp(models.Model):
    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField()

    def save(self, *args, **kwargs):
        """ On save, update timestamps """
        if not self.id:
            self.created = timezone.now()
        self.modified = timezone.now()
        return super().save(*args, **kwargs)

    class Meta:
        abstract = True


class TeamMember(ModelWithAutoTimestamp):
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


class Consultant(ModelWithAutoTimestamp):
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


class Client(ModelWithAutoTimestamp):
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
        return self.full_name + ' - ' + self.title


class MeetRating(models.IntegerChoices):
    SANGAT_TIDAK_PUAS = 1, 'Sangat Tidak Puas'
    TIDAK_PUAS = 2, 'Tidak Puas'
    BIASA = 3, 'Biasa'
    PUAS = 4, 'Puas'
    SANGAT_PUAS = 5, 'Sangat Puas'


class Meet(ModelWithAutoTimestamp):
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

    rating = models.IntegerField(default=MeetRating.BIASA, choices=MeetRating.choices)
    show_rating = models.BooleanField(default=False)

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet'

    def __str__(self):
        return self.consultant.full_name + ' - ' + self.client.full_name + ' - ' + self.datetime.strftime("%m/%d/%Y, "
                                                                                                          "%H:%M:%S")
