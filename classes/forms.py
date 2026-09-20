from django import forms 
from .models import Classe
from datetime import date


class ClasseForm(forms.ModelForm):
    class Meta:
        model=Classe
        exclude=['slug','created_at','updated_at','edited_by']