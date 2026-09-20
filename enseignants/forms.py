from django import forms 
from .models import Enseignant

class EnseignantForm(forms.ModelForm):
    class Meta:
        model=Enseignant
        exclude=['slug','created_at','updated_at','edited_by']

        widgets={
            'date_embauche':forms.TextInput(attrs={"type":'date'}),
        }