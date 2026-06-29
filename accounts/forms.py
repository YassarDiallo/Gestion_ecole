from django import forms 
from .models import Utilisateur
from django.contrib.auth.forms import UserCreationForm,UserChangeForm

class AdminForm(UserCreationForm):
    class Meta:
        model=Utilisateur
        fields=['nom','prenoms','telephone','username','email','photo','groups','is_active']
        
        labels={
            'groups':"Role de l'utilisateur"
        }
        widgets={
            'groups':forms.CheckboxSelectMultiple(attrs={'class':'form-check'})
        }
        error_messages={
            'email':{
                'unique':'Cet email éxiste déjà'
            },
            'username':{
                'unique':'Cet identifiant éxiste déjà'
            }
        }
            

class UserForm(UserCreationForm):
    class Meta:
        model=Utilisateur
        fields=['nom','prenoms','telephone','username','email','photo','groups','is_active']
        
        labels={
            'groups':"Role de l'utilisateur"
        }
        widgets={
            'groups':forms.CheckboxSelectMultiple(attrs={'class':'form-check'})
        }

        error_messages={
            'email':{
                'unique':'Cet email éxiste déjà'
            },
            'username':{
                'unique':'Cet identifiant éxiste déjà'
            }
        }
        
class UserChangeForm(UserChangeForm):
    password=None
    class Meta:
        model=Utilisateur
        fields=['nom','prenoms','telephone','username','email','photo','groups']
        labels={
            'groups':"Rôle de l'utilisateur"
        }
        widgets={
            'groups':forms.CheckboxSelectMultiple(attrs={'class':'form-check'})
        }
        

class ConnexionForm(forms.ModelForm):
    username=forms.CharField(max_length=200,label="Identifiant",widget=forms.TextInput(attrs={'class':'form-control'}))
    password=forms.CharField(max_length=100,label="Mot de passe",widget=forms.TextInput(attrs={'class':'form-control'}))
        

