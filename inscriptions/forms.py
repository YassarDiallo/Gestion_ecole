from django import forms 
from .models import Inscription

class InscriptionForm(forms.ModelForm):
    class Meta:
        model=Inscription
        exclude=['slug','created_at','updated_at','edited_by']

        widgets={
            'date_inscription':forms.TextInput(attrs={"type":'date'}),
        }