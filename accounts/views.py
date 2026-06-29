from django.shortcuts import render,HttpResponseRedirect
from utils.fonctions import get_include_template
from .models import Utilisateur
from .forms import *
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.utils import timezone
from django.contrib import messages
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.contrib.auth.views import LoginView
from django.contrib.auth import login
from django.db import transaction

# Create your views here.

class UserLogin(LoginView):
    @transaction.atomic
    def form_valid(self,form):
        login(self.request,form.get_user())
        return HttpResponseRedirect('/dashboard/')
        
class Create(CreateView):
    model=Utilisateur
    form_class=AdminForm
    template_name="accounts/create.html"
    success_url=reverse_lazy('users_index')
    
    def form_valid(self, form):
        form.instance.created_at=self.request.user
        form.instance.updated_at=timezone.now()
        user=form.save()
        groupes=self.request.POST.getlist('groups')
        if len(groupes)!=0:
            for g in groupes:
                user.groups.add(g)            
        messages.success(self.request,"Ajout effectué avec succès !")
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage_base")
        return context

class Index(ListView):
    model=Utilisateur
    template_name="accounts/index.html"
    context_object_name="users"
    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage_base")
        return context

class Edit(UpdateView):
    model=Utilisateur
    form_class=UserChangeForm
    template_name="accounts/edit.html"
    success_url=reverse_lazy('users_index')
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification éffectuée avec succès !")
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage_base")
        return context

class Delete(DeleteView):
    model=Utilisateur
    template_name='accounts/delete.html'
    success_url=reverse_lazy('users_index')
    
    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
    
