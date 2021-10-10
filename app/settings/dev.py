from app.settings.defaults import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'evaluatte',
        'USER': 'postgres',
        'HOST': '192.168.1.251',
        'PORT': '5432',
    }
}

AWS_ACCESS_KEY_ID = 'AKIAYUZSJ2AQIYJ2CNYJ'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 'evaluatte-system-test'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME

MIDTRANS_SERVER_KEY = 'SB-Mid-server-AURmn6plVIEOIpFE26Pr2kp0'
MIDTRANS_IS_PRODUCTION = False


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
