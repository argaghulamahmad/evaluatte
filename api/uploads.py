import logging
import uuid

import boto3
from django.conf import settings
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

logger = logging.getLogger('api-views')

# Only the directories the public forms actually upload to.
ALLOWED_UPLOAD_DIRECTORIES = {'CV'}

EXTENSION_BY_CONTENT_TYPE = {
    'application/pdf': 'pdf',
    'image/jpeg': 'jpg',
    'image/png': 'png',
    'image/webp': 'webp',
}

MAX_UPLOAD_BYTES = 5 * 1024 * 1024
PRESIGN_EXPIRES_SECONDS = 300


@api_view(['POST'])
def presign_upload(request):
    directory = request.data.get('directory')
    content_type = request.data.get('contentType')

    if directory not in ALLOWED_UPLOAD_DIRECTORIES or content_type not in EXTENSION_BY_CONTENT_TYPE:
        return Response(
            {"success": False, "message": "Tipe atau folder berkas tidak diizinkan!"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    if not settings.AWS_UPLOAD_BUCKET:
        logger.error('presign requested but AWS_UPLOAD_BUCKET is not configured')
        return Response(
            {"success": False, "message": "Layanan unggah berkas belum tersedia!"},
            status=status.HTTP_503_SERVICE_UNAVAILABLE,
        )

    # Server-generated key: never reuse the client's file name (path tricks, PII, collisions).
    extension = EXTENSION_BY_CONTENT_TYPE[content_type]
    key = f"{directory}/{timezone.now():%Y/%m/%d}/{uuid.uuid4().hex}.{extension}"

    s3 = boto3.client('s3', region_name=settings.AWS_UPLOAD_REGION)
    post = s3.generate_presigned_post(
        Bucket=settings.AWS_UPLOAD_BUCKET,
        Key=key,
        Fields={'Content-Type': content_type},
        Conditions=[
            {'Content-Type': content_type},
            ['content-length-range', 1, MAX_UPLOAD_BYTES],
        ],
        ExpiresIn=PRESIGN_EXPIRES_SECONDS,
    )

    return Response({
        "success": True,
        "data": {
            "url": post['url'],
            "fields": post['fields'],
            "publicUrl": f"https://{settings.AWS_UPLOAD_PUBLIC_DOMAIN}/{key}",
        },
    })
