from django import forms 
from .models import Facture, LigneFacture

class FactureForm(forms.ModelForm):
    class Meta:
        model=Facture
        exclude=['slug','created_at','updated_at','edited_by']
        
        widgets={
            'date_facture':forms.TextInput(attrs={'type':'date','class':'form-control'})
        }
        

class LigneFactureForm(forms.ModelForm):
    class Meta:
        model=LigneFacture
        exclude=['slug','created_at','updated_at','edited_by']