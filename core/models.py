import locale
from datetime import datetime

from django.contrib.auth.models import User
from django.db import models
from django.db.models import Avg
from django.utils import timezone

from app.storage_backends import PublicMediaStorage, PrivateMediaStorage


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


class Company(ModelWithAutoTimestamp):
    name = models.CharField(max_length=100)
    industry = models.CharField(max_length=100)

    class Meta:
        db_table = 'core_company'

    def __str__(self):
        return (
                str(self.name) + ' - ' +
                str(self.industry)
        )


class Consultant(ModelWithAutoTimestamp):
    user = models.OneToOneField(User, on_delete=models.DO_NOTHING, null=True, blank=True)

    profile_image = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    full_name = models.CharField(null=True, blank=True, max_length=254)
    role = models.CharField(null=True, blank=True, max_length=254)
    company = models.ForeignKey(Company, on_delete=models.DO_NOTHING, related_name='consultants')
    email = models.EmailField(null=True, blank=True, max_length=254)
    linkedin_profile = models.URLField(null=True, blank=True, max_length=254)
    phone_number = models.CharField(null=True, blank=True, max_length=254)

    is_active = models.BooleanField(null=True, blank=True)

    is_cv = models.BooleanField(null=True, blank=True)
    is_interview = models.BooleanField(null=True, blank=True)

    cv_price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    interview_price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    start_date = models.DateField()
    experience = models.TextField(null=True, blank=True)
    job_description = models.TextField(null=True, blank=True)
    role_expertise = models.TextField(null=True, blank=True)

    @property
    def formatted_cv_price(self):
        if self.cv_price:
            return locale.currency(self.cv_price, symbol=True, grouping=True)
        return locale.currency(0, symbol=True, grouping=True)

    @property
    def formatted_interview_price(self):
        if self.interview_price:
            return locale.currency(self.interview_price, symbol=True, grouping=True)
        return locale.currency(0, symbol=True, grouping=True)

    @property
    def industry(self):
        return self.company.industry

    @property
    def year_of_experience(self):
        now = datetime.now()
        return now.year - self.start_date.year

    @property
    def experience_as_list(self):
        return self.experience.split('\n')

    @property
    def job_description_as_list(self):
        return self.job_description.split('\n')

    @property
    def role_expertise_as_list(self):
        return self.role_expertise.split('\n')

    @property
    def rating(self):
        rating__avg_ = (
            Meet.objects
                .filter(show_rating=True, consultant_id=self.id)
                .aggregate(Avg('rating'))['rating__avg']
        )

        if rating__avg_ is not None:
            return round(
                rating__avg_,
                1
            )

        if rating__avg_ is None:
            return 0

    @property
    def total(self):
        return Meet.objects.filter(consultant_id=self.id, is_complete=True).count()

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_consultant'

    def __str__(self):
        return self.full_name + ' - ' + self.role + ' at ' + self.company.name


class ConsultantSchedule(ModelWithAutoTimestamp):
    MEET_TYPES = (
        ('INTERVIEW', 'Interview'),
        ('CV', 'CV'),
    )

    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING, related_name='consultant_schedules')
    start_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    type = models.CharField(max_length=254, choices=MEET_TYPES, blank=True, null=True)
    is_booked = models.BooleanField(default=False)

    class Meta:
        db_table = 'core_consultant_schedule'

    @property
    def formatted_date(self):
        return self.start_date.strftime("%A, %B %e, %Y")

    @property
    def formatted_start_time(self):
        return self.start_time.strftime("%H:%M")

    @property
    def formatted_end_time(self):
        return self.start_time.strftime("%H:%M")

    @property
    def formatted_option(self):
        return self.formatted_date + ' | ' + self.formatted_start_time + ' to ' + self.formatted_end_time

    def __str__(self):
        return str(self.consultant) + ' | ' + str(self.start_date) + ' at ' \
               + str(self.formatted_start_time) + ' to ' + str(self.formatted_end_time)


class Client(ModelWithAutoTimestamp):
    full_name = models.CharField(max_length=254)
    profile_image = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    title = models.CharField(max_length=254)
    cv_url = models.URLField(null=True, blank=True, max_length=254)
    email = models.EmailField(max_length=254, unique=True)
    phone_number = models.CharField(max_length=254)
    linkedin_profile = models.URLField(null=True, blank=True, max_length=254)
    instagram_profile = models.URLField(null=True, blank=True, max_length=254)

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


class MidtransLog(ModelWithAutoTimestamp):
    transaction_time = models.CharField(null=True, blank=True, max_length=254)
    transaction_status = models.CharField(null=True, blank=True, max_length=254)
    transaction_id = models.CharField(null=True, blank=True, max_length=254)
    store = models.CharField(null=True, blank=True, max_length=254)
    status_message = models.CharField(null=True, blank=True, max_length=254)
    status_code = models.CharField(null=True, blank=True, max_length=254)
    signature_key = models.CharField(null=True, blank=True, max_length=254)
    payment_type = models.CharField(null=True, blank=True, max_length=254)
    payment_code = models.CharField(null=True, blank=True, max_length=254)
    order_id = models.CharField(null=True, blank=True, max_length=254)
    merchant_id = models.CharField(null=True, blank=True, max_length=254)
    gross_amount = models.CharField(null=True, blank=True, max_length=254)
    currency = models.CharField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'core_midtrans_log'

        unique_together = (('transaction_id', 'order_id', 'transaction_status'),)
        indexes = [
            models.Index(fields=['transaction_id', 'order_id', 'transaction_status']),
        ]

    def __str__(self):
        return f"{self.order_id}-{self.transaction_id}"


class Meet(ModelWithAutoTimestamp):
    MEET_TYPES = (
        ('INTERVIEW', 'Interview'),
        ('CV', 'CV'),
    )

    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING, related_name='meets')
    client = models.ForeignKey(Client, on_delete=models.DO_NOTHING, related_name='meets')
    client_problem = models.TextField(null=True, blank=True)
    type = models.CharField(max_length=254, choices=MEET_TYPES)

    start_date = models.DateField(null=True, blank=True)
    start_time = models.TimeField(null=True, blank=True)
    end_time = models.TimeField(null=True, blank=True)
    is_paid = models.BooleanField(default=False, editable=False)
    payment_proof = models.ForeignKey(MidtransLog,
                                      on_delete=models.DO_NOTHING, related_name='meets', null=True, blank=True,
                                      editable=False)

    is_complete = models.BooleanField(default=False)

    testimony = models.TextField(null=True, blank=True)
    testimony_proof = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    show_testimony = models.BooleanField(default=False)

    rating = models.IntegerField(default=MeetRating.BIASA, choices=MeetRating.choices)
    show_rating = models.BooleanField(default=False)

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2, editable=False)

    @property
    def formatted_price(self):
        if self.price:
            return locale.currency(self.price, symbol=True, grouping=True)
        return locale.currency(0, symbol=True, grouping=True)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet'

        unique_together = (('client_id', 'consultant_id', 'payment_proof_id'),)
        indexes = [
            models.Index(fields=['client_id', 'consultant_id', 'payment_proof_id']),
        ]

    def __str__(self):
        return self.consultant.full_name + ' - ' + self.client.full_name + ' - ' \
               + ("" if self.start_date is None
                  else self.start_date.strftime("%m/%d/%Y")) \
               + " - " \
               + ("" if self.start_time is None
                  else self.start_time.strftime("%H:%M:%S")) \
               + " - " \
               + ("" if self.end_time is None
                  else self.end_time.strftime("%H:%M:%S"))


class MeetPayroll(ModelWithAutoTimestamp):
    FOR_CONSULTANT = 0.6
    FOR_COMPANY = 0.4

    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING, related_name='meet_payrolls')
    meet = models.ForeignKey(Meet, on_delete=models.CASCADE, related_name='meet_payrolls')

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    for_consultant = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    for_company = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    consultant_paid_proof = models.FileField(storage=PrivateMediaStorage(), blank=True, null=True)
    is_consultant_paid = models.BooleanField(default=False)

    @property
    def get_for_consultant(self):
        return float(self.price) * self.FOR_CONSULTANT

    @property
    def get_for_company(self):
        return float(self.price) * self.FOR_COMPANY

    @property
    def get_consultant(self):
        return self.meet.consultant

    @property
    def is_consultant_paid_proof(self):
        return self.consultant_paid_proof is not None

    def save(self, *args, **kwargs):
        self.consultant = self.get_consultant
        self.for_consultant = self.get_for_consultant
        self.for_company = self.get_for_company

        if self.is_consultant_paid_proof:
            self.is_consultant_paid = True
        else:
            self.is_consultant_paid = False

        super(MeetPayroll, self).save(*args, **kwargs)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet_payroll'

    def __str__(self):
        return (
                str(self.meet) + ' - ' +
                str(self.for_consultant) + ' - ' +
                str(self.for_company) + ' - ' +
                str(self.is_consultant_paid)
        )


class OrderLog(ModelWithAutoTimestamp):
    order_id = models.CharField(null=True, blank=True, max_length=254, editable=False, unique=True)
    unique_code = models.CharField(null=True, blank=True, max_length=254, editable=False, unique=True)

    client_email = models.EmailField(null=True, blank=True, max_length=254)
    client_name = models.CharField(null=True, blank=True, max_length=254)
    client_phone_number = models.CharField(null=True, blank=True, max_length=254)
    client_problem = models.TextField(null=True, blank=True)
    client_resume_url = models.URLField(null=True, blank=True, max_length=254)

    consultant_id = models.IntegerField(null=True, blank=True, )
    consultant_name = models.CharField(null=True, blank=True, max_length=254)
    consultant_price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    consultant_schedule_id = models.IntegerField(null=True, blank=True, )
    consultant_type = models.CharField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'core_order_log'
