from django import forms 
from .models import Eleve

class EleveForm(forms.ModelForm):
    class Meta:
        model=Eleve
        exclude=['slug','created_at','updated_at','edited_by']
        
        widgets={
            'date_naissance':forms.TextInput(attrs={"type":'date'})
        }