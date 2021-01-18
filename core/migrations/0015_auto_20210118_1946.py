# Generated by Django 3.1.5 on 2021-01-18 12:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0014_auto_20210118_1920'),
    ]

    operations = [
        migrations.AddField(
            model_name='meet',
            name='is_paid',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='meet',
            name='paid_proof',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='client',
            name='cv_url',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='client',
            name='instagram_profile',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='client',
            name='linkedin_profile',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='client',
            name='profile_image',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='consultant',
            name='linkedin_profile',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='consultant',
            name='profile_image',
            field=models.URLField(max_length=254),
        ),
        migrations.AlterField(
            model_name='meet',
            name='meet_url',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='meet',
            name='testimony_proof',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='teammember',
            name='instagram_profile',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='teammember',
            name='linkedin_profile',
            field=models.URLField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='teammember',
            name='profile_image',
            field=models.URLField(max_length=254),
        ),
    ]
