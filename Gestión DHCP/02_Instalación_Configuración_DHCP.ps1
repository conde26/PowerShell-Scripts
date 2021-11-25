#Instalación y Configuración DHCP
#Autor: Jose Conde 

#Ejecutar como administrador
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

#Llamada a variables
.\00_variables.ps1

#Instalación 
Install-WindowsFeature DHCP -IncludeManagementTools

#Autorizar
Add-DhcpServerInDC -DnsName $env:nombre -IPAddress $env:ip

#Eliminar mensaje error 
Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2

#Creación Ámbitos 
Add-DhcpServerv4Scope -name $env:ambito -StartRange $env:inicio -EndRange $env:final -SubnetMask $env:mascara -State Active
Add-DhcpServerv4ExclusionRange -ScopeID $env:red -StartRange $env:inicio_exclusion -EndRange $env:fin_exclusion
Set-DhcpServerv4OptionValue -Router $env:gateway -ScopeID $env:red -ComputerName $env:nombre
Set-DhcpServerv4OptionValue -ScopeID $env:red -DnsDomain $env:dns_ambito -DnsServer $env:ip
Add-DhcpServerv4Reservation -ScopeId $env:red -IPAddress $env:reserva -ClientId $env:mac -Description "Reserva Cliente"

#Final
[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $true 
$notify.showballoontip(10000,'Configuración DHCP','Completado! By Jose Conde',[system.windows.forms.tooltipicon]::Info)

