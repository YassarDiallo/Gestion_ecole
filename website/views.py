from datetime import date
from django.shortcuts import render,redirect
from django.contrib.auth.views import LogoutView
from django.contrib.auth import logout
from django.urls import reverse_lazy
from django.views import View
from django.shortcuts import get_object_or_404
from django.db.models import Sum

def dashboard(request): 
    context={}
    # print(f"Les produits sont : {produits}")
    return render(request,'dashboard.html')


def home(request):
    return render(request,'home.html')

class UserLogout(View):
    def get(self,request,*args,**kwargs):
        logout(request)
        return redirect(reverse_lazy('login'))