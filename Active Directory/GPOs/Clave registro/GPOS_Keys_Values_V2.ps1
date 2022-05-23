#Script Para Ver Claves del Registro de GPOs
#Author: Conde

#Parameters 
param(
    [Parameter(Position = 0, Mandatory=$true)]$domainName,
    [Parameter(Position = 1, Mandatory=$true)]$gpo
)

## Instalamos el modulo necesario
if(! (Get-Module GPRegistryPolicy -ErrorAction silentlycontinue)){
    Install-Module -Name GPRegistryPolicy
}

## Buscamos el GUID de la GPO
$gpoGuid = (Get-GPO -Name "$gpo").Id.ToString()

## Buscamos el fichero registry.pol 
$registryPolPath = "\\$(hostname)\sysvol\$domainName\Policies\{$gpoGuid}\Machine"
$regPolPath = Join-Path -Path $registryPolPath -ChildPath 'registry.pol'

#Comprobar si es clave de maquina o usuario
if ( Test-Path -Path $regPolPath ) {
    Write-Host -ForegroundColor Yellow "`n[*] Getting KeyName and Values" 
    Parse-PolFile -Path $regPolPath
} else {
    $registryPolPath = "\\$(hostname)\sysvol\$domainName\Policies\{$gpoGuid}\User"
    $regPolPath = Join-Path -Path $registryPolPath -ChildPath 'registry.pol'
    Write-Host -ForegroundColor Yellow "`n[*] Getting KeyName and Values" 
    Parse-PolFile -Path $regPolPath
}