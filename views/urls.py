from django.contrib.sitemaps.views import sitemap
from django.urls import path, re_path

from . import views
from .sitemaps import StaticViewSitemap

sitemaps = {
    'static': StaticViewSitemap,
}

urlpatterns = [
    re_path(r'^$', views.home, name='home'),
    re_path(r'^about/$', views.about, name='about'),

    re_path(r'^services/(?P<slug>[-\w]+)$', views.ServiceDetailView.as_view(), name='service'),
    re_path(r'^services/$', views.services, name='services'),

    re_path(r'^testimonials/$', views.testimonials, name='testimonials'),
    re_path(r'^contact/$', views.contact, name='contact'),

    re_path(r'^payment/finish$', views.payment_redirect, name='payment_finish'),
    re_path(r'^payment/unfinish$', views.payment_redirect, name='payment_unfinish'),
    re_path(r'^payment/error$', views.payment_redirect, name='payment_error'),

    re_path(r'^consultants/(?P<type>[-\w]+)$', views.ConsultantListView.as_view(), name='consultants'),

    re_path(r'^jobs/(?P<slug>[-\w]+)$', views.JobPostListView.as_view(), name='jobs_company_list'),
    re_path(r'^jobs', views.JobPostCompaniesListView.as_view(), name='jobs_companies'),
    re_path(r'^job/(?P<slug>[-\w]+)$', views.JobPostDetailView.as_view(), name='job_detail'),

    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap')
]
