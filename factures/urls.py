from django.urls import path 
from .views import *
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('',login_required(Index.as_view()),name="factures_index"),
    path('create/',login_required(Create.as_view()),name="factures_create"),
    path('delete/<str:slug>/',login_required(Delete.as_view()),name="factures_delete"),
    path('add_lignefacture/',login_required(add_lignefacture),name='add_lignefacture'),
    path('delete_lignefacture/<int:pk>/',login_required(delete_lignefacture),name='delete_lignefacture'),
    path('rapport/<int:pk>/',login_required(rapport),name='rapport'),
]
