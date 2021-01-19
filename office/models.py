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

    type = models.CharField(max_length=254, choices=EMPLOYEE_TYPES)

    linkedin_profile = models.URLField(null=True, blank=True, max_length=254)
    instagram_profile = models.URLField(null=True, blank=True, max_length=254)

    is_show = models.BooleanField(null=True, blank=True)

    class Meta:
        db_table = 'office_employee'

    def __str__(self):
        return self.full_name + ' | ' + self.position
