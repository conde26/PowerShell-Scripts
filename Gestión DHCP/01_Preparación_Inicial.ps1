#Preparación inicial WS2019
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

#Funciones para la preparación inicial
#Deshabilitar seguridad mejorada de internet 
function Deshabilitar-IE {
    Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0 -Force 
    Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0 -Force
    Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 00000000 -Force
    Stop-Process -Name Explorer -Force
}

#Activar ECO para Ipv4 e Ipv6
function Reglas-ICMP {
    Enable-NetFirewallRule -Name FPS-ICMP4-ERQ-In
    Enable-NetFirewallRule -Name FPS-ICMP6-ERQ-In
}

#Configuración de red
function Config-Red {
    New-NetIPAddress –InterfaceAlias $env:adaptador -IPAddress $env:ip –PrefixLength $env:mask -DefaultGateway $env:gateway
    Set-DnsClientServerAddress -InterfaceAlias $env:adaptador -ServerAddresses $env:dns
}


#Cambio de nombre 
function Cambio-Nombre {
    Rename-Computer $env:nombre -Restart
}


#Llamada funciones 
Deshabilitar-IE
Start-Sleep -Seconds 1
Reglas-ICMP
Start-Sleep -Seconds 1
Config-Red
Start-Sleep -Seconds 1
Cambio-Nombre