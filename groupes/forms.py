from django import forms 
from .models import Groupe
from django.core.exceptions import NON_FIELD_ERRORS

class GroupeForm(forms.ModelForm):
    class Meta:
        model=Groupe
        exclude=['author','slug','created_at','updated_at','edited_by']
        
        error_messages={
           NON_FIELD_ERRORS:{
                'unique_together':'Cet groupe éxiste déjà'
            }
        }
        