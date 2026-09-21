from django import forms 
from .models import Parent

class ParentForm(forms.ModelForm):
    class Meta:
        model=Parent
        exclude=['slug','created_at','updated_at','edited_by']