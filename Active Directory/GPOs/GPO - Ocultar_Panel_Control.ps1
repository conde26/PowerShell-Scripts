#Ocultar panel de control
#Author: Jose Conde 

#Input domain
Write-Host -NoNewline -ForegroundColor Yellow "[!] Indica el nombre de tu dominio: "; $dom=Read-Host 

#Creamos GPO con un nombre y comentario
New-GPO -Name "PanelControl" -Comment "ocultar el inicio de sesion de los usuarios"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "PanelControl" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoControlPanel -Type DWORD -Value 1

#Añadimos la directiva
New-GPLink -Name "PanelControl" -Target "DC=$($dom.Split(".")[0]),DC=$($dom.Split(".")[1])"

#Forzamos actualización
gpupdate /force 
