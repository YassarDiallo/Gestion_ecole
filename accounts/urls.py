from django.urls import path
from .views import *
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('',login_required(Index.as_view()),name="users_index"),
    path('create/',login_required(Create.as_view()),name="users_create"),
    path('edit/<str:slug>/',Edit.as_view(),name="user_edit"),
    path('delete/<str:slug>/',login_required(Delete.as_view()),name="users_delete"),
    path('login',UserLogin.as_view(),name="login")
]
