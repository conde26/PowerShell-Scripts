# Encontrar Clave Registro GPO
## Author: Conde 

En el siguiente script debemos **modificar dos variables** que son:
- **$domainController**: Donde indicamos el nombre de nuestro Windows Server  
- **$domainName**: Donde indicamos el nombre completo de nuestro dominio

Tambien debemos modificar el nombre de la GPO: 
```powershell 
Get-GPO -Name "GPO_NAME"
```

