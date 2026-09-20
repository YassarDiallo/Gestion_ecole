from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from utils.fonctions import get_include_template
from .models import Classe
from .forms import ClasseForm
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages

# Create your views here.

class Create(PermissionRequiredMixin,CreateView):
    model=Classe
    form_class=ClasseForm
    template_name="classes/create.html"
    success_url=reverse_lazy('classes_index')
    permission_required="classes.add_classe"
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        messages.success(self.request,"Ajout effectué avec succès !")
        return super().form_valid(form)
    

class Index(PermissionRequiredMixin,ListView):
    model=Classe
    template_name="classes/index.html"
    context_object_name="classes"
    permission_required="classes.view_classe"

    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage")
        return context

class Edit(PermissionRequiredMixin,UpdateView):
    model=Classe
    form_class=ClasseForm
    template_name="classes/edit.html"
    success_url=reverse_lazy('classes_index')
    permission_required="classes.change_classe"
    
    def get_object(self, queryset = None):
        return get_object_or_404(Classe,slug=self.kwargs.get('slug'))
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification effectuée avec succès !")
        return super().form_valid(form)
        

class Delete(PermissionRequiredMixin,DeleteView):
    model=Classe
    template_name="classes/delete.html"
    success_url=reverse_lazy('classes_index')
    permission_required="classes.delete_classe"

    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
