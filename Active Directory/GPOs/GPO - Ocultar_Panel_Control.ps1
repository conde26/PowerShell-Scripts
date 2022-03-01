#Ocultar panel de control
#Author: Jose Conde 

#Creamos GPO con un nombre y comentario
New-GPO -Name "PanelControl" -Comment "ocultar el inicio de sesion de los usuarios"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "PanelControl" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoControlPanel -Type DWORD -Value 1

#Añadimos la directiva
New-GPLink -Name "PanelControl" -Target "DC=Dominio,DC=com"

#Forzamos actualización
gpupdate /force 

