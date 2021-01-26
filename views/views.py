from django.core.paginator import Paginator
from django.db.models import Q
from django.shortcuts import render
from django.views.generic import DetailView, ListView

from core.models import Consultant, Meet
from office.models import Employee


def home(request):
    consultants = (
        Consultant.objects
            .filter(~Q(is_active=False))
            .order_by('id')
    )

    data = {
        "consultants": consultants,
    }

    return render(request, 'pages/home.html', data)


def about(request):
    all_team_members = Employee.objects.all().filter(is_show=True).order_by('id')

    data = {
        "team_members": all_team_members
    }

    return render(request, 'pages/about.html', data)


def services(request):
    return render(request, 'pages/services.html')


class ConsultantListView(ListView):
    model = Consultant
    template_name = 'pages/consultants.html'
    paginate_by = 9

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_queryset(self):
        consultant_type = self.kwargs['type']

        if consultant_type == 'all':
            active_consultants = Consultant.objects.filter(is_active=True)
            return active_consultants
        elif consultant_type == 'cv':
            active_cv_consultants = Consultant.objects.filter(is_active=True, is_cv=True)
            return active_cv_consultants
        elif consultant_type == 'interview':
            active_interview_consultants = Consultant.objects.filter(is_active=True, is_interview=True)
            return active_interview_consultants
        else:
            active_consultants = Consultant.objects.filter(is_active=True)
            return active_consultants


class ConsultantDetailView(DetailView):
    model = Consultant
    template_name = 'detail/consultant.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


def testimonials(request):
    all_testimonials = (
        Meet.objects
            .filter(testimony__isnull=False, show_testimony=True)
            .only('client', 'testimony')
            .order_by('-id')
    )

    paginator = Paginator(all_testimonials, 10)

    page_number = request.GET.get('page')
    testimonials_page = paginator.get_page(page_number)

    return render(request, 'pages/testimonials.html', {'testimonials_page': testimonials_page})


def contact(request):
    return render(request, 'pages/contact.html')
