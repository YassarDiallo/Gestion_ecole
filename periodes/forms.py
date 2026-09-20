from django import forms 
from .models import Periode
from datetime import date


class PeriodeForm(forms.ModelForm):    
    class Meta:
        model=Periode
        exclude=['slug','created_at','updated_at','edited_by']

        widgets={
            'date_debut':forms.TextInput(attrs={'type':'date'}),
            'date_fin':forms.TextInput(attrs={'type':'date'}),
        }