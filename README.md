# PowerShell
## Autor: Jose Conde 

En este repositorio encontrar scripts relacionados con PowerShell, que englobarán tareas de un Sysadmin, como por ejemplo:
- Instalación y Gestión de Active Directory
- Escaneo de redes, puertos (Orientada a Pentesting)
- Verificar cuantos equipos hay activos en la red
- Tareas básicas (Cambio nombre, ip, etc.)
- Instalación y gestión de DHCP 

### Nota 
Recordamos que para poder ejecutar los scripts de PowerShell, debemos modificar la politica, para ello ejecutamos la siguiente instrudcción 
```PowerShell
Set-ExectuionPolicy -ExecutionPolicy Unrestricted
``` 
Dentro de las politicas tenemos 7, que son: 
1. **AllSigned**
2. **Bypass**
3. **Default**
4. **RemoteSigned**
5. **Restricted**
6. **Undefined**
7. **Unrestricted** -> Recomendada para entornos de prácticas
Puedes obtener más información en la página de [Microsoft](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2)
