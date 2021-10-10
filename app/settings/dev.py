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

MIDTRANS_SERVER_KEY = 'SB-Mid-server-AURmn6plVIEOIpFE26Pr2kp0'
MIDTRANS_IS_PRODUCTION = False


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
