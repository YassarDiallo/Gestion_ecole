from django.urls import path 
from .views import *
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('',login_required(Index.as_view()),name="eleves_index"),
    path('create/',login_required(Create.as_view()),name="eleves_create"),
    path('edit/<str:slug>/',login_required(Edit.as_view()),name="eleves_edit"),
    path('delete/<str:slug>/',login_required(Delete.as_view()),name="eleves_delete"),
]
