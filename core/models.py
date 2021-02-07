from datetime import datetime

from django.db import models
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

    @property
    def year_of_experience(self):
        now = datetime.now()
        return now.year - self.start_date.year

    @property
    def experience_as_list(self):
        return self.experience.split('\n')

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_consultant'

    def __str__(self):
        return self.full_name + ' - ' + self.role + ' at ' + self.company.name


class ConsultantSchedule(ModelWithAutoTimestamp):
    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING, related_name='consultant_schedules')
    start_date = models.DateField()
    end_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()

    class Meta:
        db_table = 'core_consultant_schedule'

    def __str__(self):
        return str(self.consultant) + ' | ' + str(self.start_date) + ' to ' + str(self.end_date)


class Client(ModelWithAutoTimestamp):
    full_name = models.CharField(max_length=254)
    profile_image = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    title = models.CharField(max_length=254)
    cv_url = models.URLField(null=True, blank=True, max_length=254)
    email = models.EmailField(max_length=254)
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


class Meet(ModelWithAutoTimestamp):
    MEET_TYPES = (
        ('INTERVIEW', 'Interview'),
        ('CV', 'CV'),
    )

    consultant = models.ForeignKey(Consultant, on_delete=models.DO_NOTHING, related_name='meets')
    client = models.ForeignKey(Client, on_delete=models.DO_NOTHING, related_name='meets')
    type = models.CharField(max_length=254, choices=MEET_TYPES)

    start_datetime = models.DateTimeField(blank=True, null=True)
    end_datetime = models.DateTimeField(blank=True, null=True)
    is_paid = models.BooleanField(default=False)
    paid_proof = models.FileField(storage=PrivateMediaStorage(), blank=True, null=True)

    meet_url = models.URLField(null=True, blank=True, max_length=254)
    is_complete = models.BooleanField(default=False)

    testimony = models.TextField(null=True, blank=True)
    testimony_proof = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    show_testimony = models.BooleanField(default=False)

    rating = models.IntegerField(default=MeetRating.BIASA, choices=MeetRating.choices)
    show_rating = models.BooleanField(default=False)

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet'

    def __str__(self):
        return self.consultant.full_name + ' - ' + self.client.full_name + ' - ' \
               + ("" if self.start_datetime is None
                  else self.start_datetime.strftime("%m/%d/%Y, ""%H:%M:%S")) \
               + ("" if self.end_datetime is None
                  else self.end_datetime.strftime("%m/%d/%Y, ""%H:%M:%S"))


class MeetPayment(ModelWithAutoTimestamp):
    PAYMENT_METHODS = (
        ('BCA', 'Transfer BCA'),
        ('BNI', 'Transfer BNI'),
    )

    meet = models.ForeignKey(Meet, on_delete=models.DO_NOTHING, related_name='meet_payments')

    due_datetime = models.DateTimeField()

    method = models.CharField(null=True, blank=True, max_length=254, choices=PAYMENT_METHODS)

    price = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    admin_cost = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)
    total = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    @property
    def get_total(self):
        return self.price + self.admin_cost

    def save(self, *args, **kwargs):
        self.total = self.get_total
        super(MeetPayment, self).save(*args, **kwargs)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'core_meet_payment'

    def __str__(self):
        return (
                str(self.meet) + ' - ' +
                self.due_datetime.strftime("%m/%d/%Y, %H:%M:%S") + ' - ' +
                str(self.total)
        )


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
