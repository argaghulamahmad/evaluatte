from django.db import models

from core.models import ModelWithAutoTimestamp


class Employee(ModelWithAutoTimestamp):
    EMPLOYEE_TYPES = (
        ('FOUNDER', 'Founder'),
        ('CO-FOUNDER', 'Co Founder'),
        ('FULL-TIME', 'Full time'),
        ('PART-TIME', 'Part time'),
        ('INTERN', 'Intern'),
    )

    profile_image = models.URLField(max_length=254)
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

    total = models.DecimalField(null=True, blank=True, max_digits=100, decimal_places=2)

    employee_paid_proof = models.URLField(null=True, blank=True, max_length=254)
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
