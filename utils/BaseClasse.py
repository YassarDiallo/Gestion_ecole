from django.db import models
from django.conf import settings
User = settings.AUTH_USER_MODEL
from autoslug import AutoSlugField
import secrets

class ClasseBasique(models.Model):
    author=models.ForeignKey(User,on_delete=models.CASCADE,null=True,blank=True,editable=False)
    slug=AutoSlugField(unique=True,editable=False)
    created_at=models.DateTimeField(auto_now_add=True,editable=False)
    updated_at=models.DateTimeField(auto_now=True,editable=False)
    edited_by=models.IntegerField(null=True,blank=True,editable=False)
    
    
    def save(self,*args,**kwargs):
        if not self.slug:
            self.slug=secrets.token_urlsafe(32)
        super().save(*args,**kwargs)

    class Meta:
        abstract=True

