from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from utils.fonctions import get_include_template
from .models import Periode
from .forms import PeriodeForm
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages

# Create your views here.

class Create(PermissionRequiredMixin,CreateView):
    model=Periode
    form_class=PeriodeForm
    template_name="periodes/create.html"
    success_url=reverse_lazy('periodes_index')
    permission_required="periodes.add_periode"
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        messages.success(self.request,"Ajout effectué avec succès !")
        return super().form_valid(form)
    

class Index(PermissionRequiredMixin,ListView):
    model=Periode
    template_name="periodes/index.html"
    context_object_name="periodes"
    permission_required="periodes.view_periode"

    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage")
        return context

class Edit(PermissionRequiredMixin,UpdateView):
    model=Periode
    form_class=PeriodeForm
    template_name="periodes/edit.html"
    success_url=reverse_lazy('periodes_index')
    permission_required="periodes.change_periode"
    
    def get_object(self, queryset = None):
        return get_object_or_404(Periode,slug=self.kwargs.get('slug'))
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification effectuée avec succès !")
        return super().form_valid(form)
        

class Delete(PermissionRequiredMixin,DeleteView):
    model=Periode
    template_name="periodes/delete.html"
    success_url=reverse_lazy('periodes_index')
    permission_required="periodes.delete_periode"

    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
