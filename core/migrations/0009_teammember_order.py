# Generated by Django 3.1.5 on 2021-01-16 10:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0008_auto_20210116_0949'),
    ]

    operations = [
        migrations.AddField(
            model_name='teammember',
            name='order',
            field=models.IntegerField(blank=True, null=True),
            preserve_default=False,
        ),
    ]