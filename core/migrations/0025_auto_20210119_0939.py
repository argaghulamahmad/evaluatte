# Generated by Django 3.1.5 on 2021-01-19 02:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0024_delete_teammember'),
    ]

    operations = [
        migrations.AlterField(
            model_name='meet',
            name='type',
            field=models.CharField(choices=[('INTERVIEW', 'Interview'), ('CV', 'CV')], default='INTERVIEW', max_length=254),
            preserve_default=False,
        ),
    ]
