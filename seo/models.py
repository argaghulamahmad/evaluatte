from django.db import models
from django.utils import timezone
from django.utils.text import slugify


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
    name = models.CharField(unique=True, max_length=100)
    industry = models.CharField(max_length=100)
    slug = models.SlugField(max_length=255, verbose_name='Job Post Company Slug', default=name)

    class Meta:
        db_table = 'seo_job_post_company'

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(JobPostCompany, self).save(*args, **kwargs)

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
    type = models.CharField(max_length=254, choices=JOB_TYPES, null=True, blank=True)
    position = models.CharField(max_length=254)
    location = models.CharField(max_length=254)
    slug = models.SlugField(max_length=255, verbose_name='Job Post Slug', default=(
        f'{company.name} {type} {position} {location}'))

    job_description = models.TextField(null=True, blank=True)
    min_qualification = models.TextField(null=True, blank=True)

    @property
    def job_description_as_list(self):
        return self.job_description.split('\n')

    @property
    def min_qualification_as_list(self):
        return self.min_qualification.split('\n')

    due_date = models.DateField()

    link_to_apply = models.URLField(null=True, blank=True, max_length=254)
    recruiter_email_address = models.EmailField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'seo_job_post'

    def save(self, *args, **kwargs):
        self.slug = slugify(f'{self.company.name} {self.type} {self.position} {self.location}')
        super(JobPost, self).save(*args, **kwargs)

    def __str__(self):
        return f'{self.company.name} - {self.position} - {self.location}'
