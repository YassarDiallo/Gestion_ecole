from django import forms 
from .models import Matiere

class MatiereForm(forms.ModelForm):
    class Meta:
        model=Matiere
        exclude=['slug','created_at','updated_at','edited_by']