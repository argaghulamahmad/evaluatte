from django.contrib.auth.models import User
from django.db import models

from app.storage_backends import PublicMediaStorage, PrivateMediaStorage
from core.models import ModelWithAutoTimestamp


class Employee(ModelWithAutoTimestamp):
    EMPLOYEE_TYPES = (
        ('FOUNDER', 'Founder'),
        ('CO-FOUNDER', 'Co Founder'),
        ('FULL-TIME', 'Full time'),
        ('PART-TIME', 'Part time'),
        ('INTERN', 'Intern'),
    )

    user = models.OneToOneField(User, on_delete=models.DO_NOTHING, null=True, blank=True)

    profile_image = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    full_name = models.CharField(max_length=254)
    position = models.CharField(max_length=254)
    salary = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    type = models.CharField(max_length=254, choices=EMPLOYEE_TYPES)

    linkedin_profile = models.URLField(null=True, blank=True, max_length=254)
    instagram_profile = models.URLField(null=True, blank=True, max_length=254)

    is_show = models.BooleanField(null=True, blank=True)

    class Meta:
        db_table = 'office_employee'

    def __str__(self):
        return self.full_name + ' | ' + self.position


class EmployeePayroll(ModelWithAutoTimestamp):
    employee = models.ForeignKey(Employee, on_delete=models.DO_NOTHING)

    date = models.DateField()

    total = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    employee_paid_proof = models.FileField(storage=PrivateMediaStorage(), blank=True, null=True)
    is_employee_paid = models.BooleanField(default=False)

    @property
    def get_employee_salary(self):
        return self.employee.salary

    @property
    def is_employee_paid_proof(self):
        return self.employee_paid_proof is not None

    def save(self, *args, **kwargs):
        self.total = self.get_employee_salary

        if self.is_employee_paid_proof:
            self.is_employee_paid = True
        else:
            self.is_employee_paid = False

        super(EmployeePayroll, self).save(*args, **kwargs)

    note = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'office_employee_payroll'

    def __str__(self):
        return (
                str(self.employee) + ' - ' +
                str(self.total) + ' - ' +
                str(self.employee_paid_proof) + ' - ' +
                str(self.is_employee_paid)
        )
