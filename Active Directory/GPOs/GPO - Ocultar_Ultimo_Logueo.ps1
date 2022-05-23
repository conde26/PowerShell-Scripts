#Ocultar inicios de sesión
#Author: Jose Conde

#Input domain
Write-Host -NoNewline -ForegroundColor Yellow "[!] Indica el nombre de tu dominio: "; $dom=Read-Host 

#Creamos GPO con un nombre y comentario
New-GPO -Name "Ocultar Inicio" -Comment "ocultar el inicio de sesion de los usuarios"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "Ocultar Inicio" -Key "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" -ValueName dontdisplaylastusername -Type Dword -Value 1

#Añadimos la directiva a una OU
New-GPLink -Name "Ocultar Inicio" -Target "DC=$($dom.Split(".")[0]),DC=$($dom.Split(".")[1])"

#forzamos su inicio
gpupdate /force
