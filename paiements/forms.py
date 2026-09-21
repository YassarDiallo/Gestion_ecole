from django import forms 
from .models import Paiement

class PaiementForm(forms.ModelForm):
    class Meta:
        model=Paiement
        exclude=['slug','created_at','updated_at','edited_by']
        
        widgets={
            'date_paiement':forms.TextInput(attrs={"type":"date"})
        }