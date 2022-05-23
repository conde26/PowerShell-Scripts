#Unir cliente Dominio
#Autor: Conde

#Ejecutar script como administrador
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

#Dominio y no mostrar prompt
Write-Host "[!] Indica el dominio al que quieres unirte: " -NoNewline -ForegroundColor Yellow
$dominio = read-host 
$usuario="administrator"
$contra= ConvertTo-SecureString "abc123." -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList ($usuario, $contra)

#Unir cliente dominio
Add-Computer -DomainName $dominio -Credential $cred
klist –li 0x3e7 purge | out-null
gpupdate /force | out-null
Write-Host "`n[!] El equipo se unio correctamente al dominio`n`n" -ForegroundColor Yellow



