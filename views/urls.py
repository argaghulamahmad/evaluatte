from django.conf.urls import url
from django.contrib.sitemaps.views import sitemap
from django.urls import re_path, path

from . import views
from .sitemaps import StaticViewSitemap

sitemaps = {
    'static': StaticViewSitemap,
}

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^about/$', views.about, name='about'),

    re_path(r'^services/(?P<slug>[-\w]+)$', views.ServiceDetailView.as_view(), name='service'),
    url(r'^services/$', views.services, name='services'),

    url(r'^testimonials/$', views.testimonials, name='testimonials'),
    url(r'^contact/$', views.contact, name='contact'),

    url(r'^payment/finish$', views.payment_redirect, name='payment_finish'),
    url(r'^payment/unfinish$', views.payment_redirect, name='payment_unfinish'),
    url(r'^payment/error$', views.payment_redirect, name='payment_error'),

    re_path(r'^consultants/(?P<type>[-\w]+)$', views.ConsultantListView.as_view(), name='consultants'),

    re_path(r'^jobs/(?P<slug>[-\w]+)$', views.JobPostListView.as_view(), name='jobs_company_list'),
    re_path(r'^jobs', views.JobPostCompaniesListView.as_view(), name='jobs_companies'),
    re_path(r'^job/(?P<slug>[-\w]+)$', views.JobPostDetailView.as_view(), name='job_detail'),

    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap')
]
