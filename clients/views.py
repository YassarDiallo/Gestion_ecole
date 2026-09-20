from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from utils.fonctions import get_include_template
from .models import Client
from .forms import ClientForm
from django.views.generic import CreateView,ListView,UpdateView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.platypus import Table,SimpleDocTemplate,Frame,Paragraph,Spacer,Image
from reportlab.lib import colors
from reportlab.lib.units import inch
from reportlab.lib.colors import pink,black,red,blue,green
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .serializer import ClientSerializers
# Create your views here.

@api_view(['GET'])
def client_list(request):
    clients=Client.objects.all()
    clientSerializer=ClientSerializers(clients,many=True)
    return Response(clientSerializer.data)  

def print_client(request):
    context={}
    return render(request,'clients/print_client.html',context)


class Create(PermissionRequiredMixin,CreateView):
    model=Client
    form_class=ClientForm
    template_name="clients/create.html"
    success_url=reverse_lazy('clients_index')
    permission_required="clients.add_client"
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        messages.success(self.request,"Ajout effectué avec succès !")
        return super().form_valid(form)
    

class Index(PermissionRequiredMixin,ListView):
    model=Client
    template_name="clients/index.html"
    context_object_name="clients"
    permission_required="clients.view_client"

    
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage")
        return context

class Edit(PermissionRequiredMixin,UpdateView):
    model=Client
    form_class=ClientForm
    template_name="clients/edit.html"
    success_url=reverse_lazy('clients_index')
    permission_required="clients.change_client"
    
    def get_object(self, queryset = None):
        return get_object_or_404(Client,slug=self.kwargs.get('slug'))
    
    def form_valid(self,form):
        form.instance.updated_at=timezone.now()
        form.instance.edited_by=self.request.user.id
        messages.success(self.request,"Modification effectuée avec succès !")
        return super().form_valid(form)
        

class Delete(PermissionRequiredMixin,DeleteView):
    model=Client
    template_name="clients/delete.html"
    success_url=reverse_lazy('clients_index')
    permission_required="clients.delete_client"

    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
