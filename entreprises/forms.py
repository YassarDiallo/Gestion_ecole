from django import forms 
from .models import Entreprise

class EntrepriseForm(forms.ModelForm):
    class Meta:
        model=Entreprise
        exclude=['slug','created_at','updated_at','edited_by']