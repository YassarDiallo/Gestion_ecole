from datetime import datetime
from django.shortcuts import render
from django.urls import reverse_lazy
from utils.fonctions import get_include_template
from .models import Groupe
from .forms import GroupeForm
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from .models import Group
# Create your views here.

class Create(CreateView):
    model=Groupe
    form_class=GroupeForm
    template_name="groupes/create.html"
    success_url=reverse_lazy('groupes_index')
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        response=super().form_valid(form)

        permissions = self.request.POST.getlist('permissions')
        self.object.permissions.set(permissions)
        messages.success(self.request,"Ajout effectué avec succès !")
        return response

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        permissions_by_model = {}
        for ct in ContentType.objects.all():
            perms = Permission.objects.filter(content_type=ct)
            if perms.exists() and ct.app_label not in ['admin', 'auth', 'contenttypes', 'sessions','groupes']:
                label = f"{ct.app_label.title()} | {ct.model.replace('_', ' ').title()}"

                translated_perms = []
                for perm in perms:
                    name = perm.name

                    if name.startswith("Can add"):
                        name = name.replace("Can add", "Peut ajouter")
                    elif name.startswith("Can change"):
                        name = name.replace("Can change", "Peut modifier")
                    elif name.startswith("Can delete"):
                        name = name.replace("Can delete", "Peut supprimer")
                    elif name.startswith("Can view"):
                        name = name.replace("Can view", "Peut afficher")

                    class TranslatedPerm:
                        def __init__(self, id, name):
                            self.id = id
                            self.name = name

                    translated_perms.append(TranslatedPerm(perm.id, name))
                permissions_by_model[label] = translated_perms
                for p, k in permissions_by_model.items():
                    print(f"libelle: {p}")
                    for v in k:
                        print(f"id: {v.id}  value {v.name}")
        context["permissions_by_model"] = permissions_by_model
        context["template_include"] = get_include_template("parametrage_base")
        return context
        
class Index(ListView):
    model=Groupe
    template_name="groupes/index.html"
    context_object_name="groupes"
    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage_base")
        return context

class Edit(UpdateView):
    model=Groupe
    form_class=GroupeForm
    template_name="groupes/edit.html"
    success_url=reverse_lazy('groupes_index')
    
    def get_object(self, queryset = None):
        return get_object_or_404(Groupe,slug=self.kwargs.get('slug'))
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification effectuée avec succès !")
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage_base")
        return context

class Delete(DeleteView):
    model=Groupe
    template_name="groupes/delete.html"
    success_url=reverse_lazy('groupes_index')
    
    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)

    
    