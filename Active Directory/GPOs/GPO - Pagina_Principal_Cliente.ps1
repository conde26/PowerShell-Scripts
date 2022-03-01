#Configurar página de inicio clientes
#Author: Jose Conde

#Creamos GPO con un nombre y comentario
New-GPO -Name "Pagina_Inicio" -Comment "Pagina de inicio la de nuestro instituto"

#Añadimos un nombre y la clave del reistro 
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName Default_Page_URL -Type String -Value http://www.edu.xunta.gal/centros/iesmurallaromana/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "Search Page" -Type String -Value http://www.edu.xunta.gal/centros/iesmurallaromana/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "Start Page" -Type String -Value http://www.edu.xunta.gal/centros/iesmurallaromana/
Set-GPRegistryValue -Name "Pagina_Inicio" -Key "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -ValueName "First Home Page" -Type String -Value http://www.edu.xunta.gal/centros/iesmurallaromana/

#Añadimos la directiva
New-GPLink -Name "Pagina_Inicio" -Target "DC=Dominio,DC=com"

#Forzamos actualización 
gpupdate /force 




