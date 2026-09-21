from django import forms 
from .models import ParentEleve

class ParentEleveForm(forms.ModelForm):
    class Meta:
        model=ParentEleve
        exclude=['slug','created_at','updated_at','edited_by']
        