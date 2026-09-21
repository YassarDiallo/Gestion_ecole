from django import forms 
from .models import Absence

class AbsenceForm(forms.ModelForm):
    class Meta:
        model=Absence
        exclude=['slug','created_at','updated_at','edited_by']
        
        widgets={
            'date_absence':forms.TextInput(attrs={"type":"date"})
        }