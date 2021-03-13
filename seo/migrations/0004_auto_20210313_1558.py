# Generated by Django 3.1.6 on 2021-03-13 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('seo', '0003_auto_20210313_1417'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobpostcompany',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='jobpostcompany',
            name='slug',
            field=models.SlugField(default=models.CharField(max_length=100), max_length=255, verbose_name='Job Post Company Slug'),
        ),
    ]
