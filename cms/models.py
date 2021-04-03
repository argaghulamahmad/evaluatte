from django.db import models
from django.utils import timezone
from django.utils.text import slugify

from app.storage_backends import PublicMediaStorage


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


class Product(ModelWithAutoTimestamp):
    name = models.CharField(max_length=100)
    image = models.FileField(storage=PublicMediaStorage(), blank=True, null=True)
    items = models.TextField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    link = models.URLField(null=True, blank=True, max_length=254)
    cta_text = models.CharField(max_length=100, null=True, blank=True)

    slug = models.SlugField(max_length=255, verbose_name='CMS Product', default=name, null=True, blank=True)

    @property
    def items_as_list(self):
        return self.items.split('\n')

    class Meta:
        db_table = 'cms_product'

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)

    def __str__(self):
        return (
            f'{str(self.name)} - {str(self.link)}'
        )
