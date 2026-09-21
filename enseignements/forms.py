from django import forms 
from .models import Enseignement

class EnseignementForm(forms.ModelForm):
    class Meta:
        model=Enseignement
        exclude=['slug','created_at','updated_at','edited_by']