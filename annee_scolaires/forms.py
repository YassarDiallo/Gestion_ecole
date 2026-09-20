from django import forms 
from .models import AnneeScolaire
from datetime import date


def annees_choices():
        an = date.today().year
        return [(f"{a}-{a + 1}", f"{a}-{a + 1}") for a in range(an - 5, an + 6)]

class AnneeScolaireForm(forms.ModelForm):
    
    libele = forms.ChoiceField(
        choices=annees_choices,
        widget=forms.Select(attrs={'class': 'form-control'}),
    )
     
    class Meta:
        model=AnneeScolaire
        exclude=['slug','created_at','updated_at','edited_by']

        widgets={
            'date_debut':forms.DateInput(attrs={'type':'date'}),
            'date_fin':forms.DateInput(attrs={'type':'date'}),
            'libele':forms.DateInput(attrs={'type':'year'}),
        }