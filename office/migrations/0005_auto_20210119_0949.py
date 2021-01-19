# Generated by Django 3.1.5 on 2021-01-19 02:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('office', '0004_auto_20210119_0940'),
    ]

    operations = [
        migrations.AddField(
            model_name='employee',
            name='salary',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=100, null=True),
        ),
        migrations.CreateModel(
            name='EmployeePayroll',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(editable=False)),
                ('modified', models.DateTimeField()),
                ('total', models.DecimalField(blank=True, decimal_places=2, max_digits=100, null=True)),
                ('employee_paid_proof', models.URLField(blank=True, max_length=254, null=True)),
                ('is_employee_paid', models.BooleanField(default=False)),
                ('note', models.TextField(blank=True, null=True)),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='office.employee')),
            ],
            options={
                'db_table': 'office_employee_payroll',
            },
        ),
    ]
