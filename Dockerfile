# syntax=docker/dockerfile:1

# ---- builder: compile wheels (psycopg2 is built from source against libpq) ----
FROM python:3.10-slim-bookworm AS builder

ENV PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY requirements.txt .
RUN pip wheel --wheel-dir /wheels -r requirements.txt

# ---- runtime ----
FROM python:3.10-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    DJANGO_SETTINGS_MODULE=app.settings.production \
    LOG_DIR=/var/log/evaluatte

RUN apt-get update \
 && apt-get install -y --no-install-recommends libpq5 \
 && rm -rf /var/lib/apt/lists/* \
 && useradd --create-home --uid 10001 app

WORKDIR /app

COPY --from=builder /wheels /wheels
COPY requirements.txt .
RUN pip install --no-index --find-links=/wheels -r requirements.txt \
 && rm -rf /wheels

COPY . .

# collectstatic needs the production settings to import. These dummy values exist only in this RUN layer.
RUN mkdir -p "$LOG_DIR" /app/app/media \
 && DJANGO_SECRET_KEY=build-only-collectstatic-key-not-used-at-runtime-0000000000000000 \
    MIDTRANS_SERVER_KEY=build-only \
    python manage.py collectstatic --noinput \
 && chown -R app:app "$LOG_DIR" /app/app/media

USER app

EXPOSE 8000

CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3", "--access-logfile", "-"]
