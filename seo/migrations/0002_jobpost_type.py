# Generated by Django 3.1.6 on 2021-03-13 04:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('seo', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='type',
            field=models.CharField(blank=True, choices=[('FULL-TIME', 'Full Time'), ('PART-TIME', 'Part Time'), ('CONTRACT', 'Contract'), ('INTERN', 'Intern'), ('FREELANCE', 'Freelance')], max_length=254, null=True),
        ),
    ]
