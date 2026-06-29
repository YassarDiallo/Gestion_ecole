from django.urls import path 
from .views import *
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('',login_required(Index.as_view()),name="clients_index"),
    path('create/',login_required(Create.as_view()),name="clients_create"),
    path('edit/<str:slug>/',login_required(Edit.as_view()),name="clients_edit"),
    path('delete/<str:slug>/',login_required(Delete.as_view()),name="clients_delete"),
    path('print_client/',login_required(print_client),name='print_client'),
    path('client_list/',login_required(client_list),name='client_list'),
]
