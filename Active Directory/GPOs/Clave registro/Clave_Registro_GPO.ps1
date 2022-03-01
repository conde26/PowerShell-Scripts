#Script Para Ver Claves del Registro de GPOs
#Author: Jose Conde

## Buscamos el GUID de la GPO
$gpoGuid = (Get-GPO -Name 'sesión').Id.ToString()

## Buscamos el fichero registry.pol 
$domainController = 'HOSTNAME_SERVER'
$domainName = 'DOMAIN.COM'
$registryPolPath = "\\$domainController\sysvol\$domainName\Policies\{$gpoGuid}\User"
Get-ChildItem -Path $registryPolPath

$regPolPath = Join-Path -Path $registryPolPath -ChildPath 'registry.pol'

## Instalamos el modulo registry.pol 
Install-Module -Name GPRegistryPolicy

## Vemos la clave y los valores de la GPO
Parse-PolFile -Path $regPolPath
pause
