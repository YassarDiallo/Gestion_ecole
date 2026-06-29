from django import forms 
from .models import Produit

class ProduitForm(forms.ModelForm):
    class Meta:
        model=Produit
        exclude=['slug','created_at','updated_at','edited_by']