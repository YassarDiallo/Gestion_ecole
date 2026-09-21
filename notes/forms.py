from django import forms 
from .models import Note

class NoteForm(forms.ModelForm):
    class Meta:
        model=Note
        exclude=['slug','created_at','updated_at','edited_by']