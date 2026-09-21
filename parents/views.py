from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from utils.fonctions import get_include_template
from .models import Parent
from .forms import ParentForm
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages

# Create your views here.

class Create(PermissionRequiredMixin,CreateView):
    model=Parent
    form_class=ParentForm
    template_name="parents/create.html"
    success_url=reverse_lazy('parents_index')
    permission_required="parents.add_parent"
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        messages.success(self.request,"Ajout effectué avec succès !")
        return super().form_valid(form)
    

class Index(PermissionRequiredMixin,ListView):
    model=Parent
    template_name="parents/index.html"
    context_object_name="parents"
    permission_required="parents.view_parent"

    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage")
        return context

class Edit(PermissionRequiredMixin,UpdateView):
    model=Parent
    form_class=ParentForm
    template_name="parents/edit.html"
    success_url=reverse_lazy('parents_index')
    permission_required="parents.change_parent"
    
    def get_object(self, queryset = None):
        return get_object_or_404(Parent,slug=self.kwargs.get('slug'))
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification effectuée avec succès !")
        return super().form_valid(form)
        

class Delete(PermissionRequiredMixin,DeleteView):
    model=Parent
    template_name="parents/delete.html"
    success_url=reverse_lazy('parents_index')
    permission_required="parents.delete_parent"

    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
