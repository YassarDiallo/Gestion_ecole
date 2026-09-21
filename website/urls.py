from django.conf import settings
from django.contrib import admin
from django.urls import path,include
from website.views import *
from accounts.views import UserLogin
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/',login_required(home),name="home"),
    path('',UserLogin.as_view(),name="login"),
    path('dashboard/',login_required(dashboard),name="dashboard"),
    path('logout/',login_required(UserLogout.as_view()),name="logout"),  
    path("ckeditor5/", include('django_ckeditor_5.urls'), name="ck_editor_5_upload_file"),
    # ---------------------------------------
    path('accounts/',include('accounts.urls')),
    path('groupes/',include('groupes.urls')),
    # --------------------------------------------
    path('clients/',include('clients.urls')),
    path('entreprises/',include('entreprises.urls')),
    path('annee_scolaires/',include('annee_scolaires.urls')),
    path('enseignants/',include('enseignants.urls')),
    path('matieres/',include('matieres.urls')),
    path('periodes/',include('periodes.urls')),
    path('classes/',include('classes.urls')),
    path('eleves/',include('eleves.urls')),
    path('parents/',include('parents.urls')),
    path('enseignements/',include('enseignements.urls')),
    path('inscriptions/',include('inscriptions.urls')),
    path('parent_eleves/',include('parent_eleves.urls')),
    path('notes/',include('notes.urls')),
    path('absences/',include('absences.urls')),
    path('paiements/',include('paiements.urls')),
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

