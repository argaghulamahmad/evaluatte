from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^about/$', views.about, name='about'),
    url(r'^services/$', views.services, name='services'),
    url(r'^consultants/$', views.consultants, name='consultants'),
    url(r'^testimonials/$', views.testimonials, name='testimonials'),
    url(r'^inspirations/$', views.inspirations, name='inspirations'),
    url(r'^careers/$', views.careers, name='careers'),
    url(r'^ssubscribe/$', views.subscribe, name='subscribe'),
]
