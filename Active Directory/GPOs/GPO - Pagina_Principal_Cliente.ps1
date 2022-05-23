#Configurar página de inicio clientes
#Author: Jose Conde

#Input domain
Write-Host -NoNewline -ForegroundColor Yellow "[!] Indica el nombre de tu dominio: "; $dom=Read-Host 

#Creamos GPO con un nombre y comentario
New-GPO -Name "Pagina_Inicio" -Comment "Página por defecto en el navegador"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName Default_Page_URL -Type String -Value https://rinconh4ck.blogspot.com/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "Search Page" -Type String -Value https://rinconh4ck.blogspot.com/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "Start Page" -Type String -Value https://rinconh4ck.blogspot.com/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "First Home Page" -Type String -Value https://rinconh4ck.blogspot.com/

#Añadimos la directiva
New-GPLink -Name "Pagina_Inicio" -Target "DC=$($dom.Split(".")[0]),DC=$($dom.Split(".")[1])"

#Forzamos actualización 
gpupdate /force 
