from django.db import models
from django.contrib.auth.models import Group
from django.conf import settings
User=settings.AUTH_USER_MODEL
from autoslug import AutoSlugField
import secrets
# Create your models here.

class Groupe(Group):
    author=models.ForeignKey(User,on_delete=models.CASCADE,null=True,editable=False)
    slug=AutoSlugField(unique=True,editable=False)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)
    edited_by=models.IntegerField(null=True,blank=True)
    
    def __str__(self):
        return f'{self.name}'
    

    def save(self,*args,**kwargs):
        if not self.slug:
            self.slug=secrets.token_urlsafe(32)
        super().save(*args,**kwargs)

    class Meta:
        db_table="groupes"