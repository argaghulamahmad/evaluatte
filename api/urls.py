from django.urls import path

from api import views, uploads

urlpatterns = [
    path('order', views.order),
    path('order/webhook', views.order_webhook),
    path('uploads/presign', uploads.presign_upload),
]
