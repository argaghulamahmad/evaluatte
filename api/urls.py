from django.urls import path

from api import views

urlpatterns = [
    path('order', views.order),
    path('order/webhook', views.order_webhook),
]
