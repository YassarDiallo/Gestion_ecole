from rest_framework import serializers
from .models import Client

class ClientSerializers(serializers.ModelSerializer):
    class Meta:
        model=Client
        fields=['nom','telephone','adresse','email']
    
    def validate_telephone(self,value):
        if not value.isdigit():
            raise serializers.ValidationError(
                'Le numero telephone ne doit contenir des chiffres'
            )
            return value