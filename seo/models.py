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


class JobPostCompany(ModelWithAutoTimestamp):
    name = models.CharField(max_length=100)
    industry = models.CharField(max_length=100)

    class Meta:
        db_table = 'seo_job_post_company'

    def __str__(self):
        return (
            f'{str(self.name)} - {str(self.industry)}'
        )


class JobPost(ModelWithAutoTimestamp):
    JOB_TYPES = (
        ('FULL-TIME', 'Full Time'),
        ('PART-TIME', 'Part Time'),
        ('CONTRACT', 'Contract'),
        ('INTERN', 'Intern'),
        ('FREELANCE', 'Freelance'),
    )

    company = models.ForeignKey(JobPostCompany, on_delete=models.DO_NOTHING, related_name='job_posts')
    type = models.CharField(max_length=254, choices=JOB_TYPES)
    position = models.CharField(max_length=254)
    location = models.CharField(max_length=254)

    job_description = models.TextField(null=True, blank=True)
    min_qualification = models.TextField(null=True, blank=True)

    due_date = models.DateField()

    link_to_apply = models.URLField(null=True, blank=True, max_length=254)
    recruiter_email_address = models.EmailField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'seo_job_post'

    def __str__(self):
        return f'{self.company.name} - {self.position} - {self.location}'
