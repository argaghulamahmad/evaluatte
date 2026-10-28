import os

from app.settings.defaults import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS += [
    '35.223.165.71',
    'evaluatte.com',
    'evaluatte.argaghulamahmad.dev',
    'www.evaluatte.com',
]

# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ.get('DB_NAME', 'evaluatte'),
        'USER': os.environ.get('DB_USER', ''),
        'PASSWORD': os.environ.get('DB_PASSWORD', ''),
        'HOST': os.environ.get('DB_HOST', ''),
        'PORT': os.environ.get('DB_PORT', ''),
    }
}

MIDTRANS_SERVER_KEY = os.environ.get('MIDTRANS_SERVER_KEY', '')
MIDTRANS_IS_PRODUCTION = True
if not MIDTRANS_SERVER_KEY:
    from django.core.exceptions import ImproperlyConfigured

    raise ImproperlyConfigured('MIDTRANS_SERVER_KEY environment variable is required in production')


# Django Debug Toolbar
def show_toolbar(request):
    return False


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}

# Logging
# Never enable django.db.backends at DEBUG here: it writes every SQL statement, including bound parameters (PII).
LOG_DIR = os.environ.get('LOG_DIR') or '/home/argaghulamahmad/logs'
LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': '{levelname} [{asctime}] {message} {pathname} {lineno} {funcName}',
            'style': '{',
        },
    },
    'handlers': {
        'evaluatte-file-handler': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': os.path.join(LOG_DIR, 'evaluatte.log'),
            'formatter': 'verbose'
        },
        'django-error-handler': {
            'level': 'WARNING',
            'class': 'logging.FileHandler',
            'filename': os.path.join(LOG_DIR, 'evaluatte.django.log'),
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'evaluatte': {
            'handlers': ['evaluatte-file-handler'],
            'level': 'INFO',
            'propagate': True
        },
        'api-views': {
            'handlers': ['evaluatte-file-handler'],
            'level': 'INFO',
            'propagate': False
        },
        'django': {
            'handlers': ['django-error-handler'],
            'level': 'ERROR',
            'propagate': False
        },
    },
}
