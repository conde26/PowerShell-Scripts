#Fix SMBRelay
#Author: Conde 

#Input domain
Write-Host -NoNewline -ForegroundColor Yellow "[!] Indica el nombre de tu dominio: "; $dom=Read-Host 

#Creamos GPO con un nombre y comentario
New-GPO -Name "SMBRelay" -Comment "Fix SMBRelay Attack"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "SMBRelay" -Key "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" -ValueName EnableMulticast -Type DWORD -Value 0

#Añadimos la directiva (Debemos modificar el tarjet)
New-GPLink -Name "SMBRelay" -Target "DC=$($dom.Split(".")[0]),DC=$($dom.Split(".")[1])"

#Forzamos actualización
gpupdate /force 

