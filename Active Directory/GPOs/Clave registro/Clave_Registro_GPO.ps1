#Script Para Ver Claves del Registro de GPOs
#Author: Conde

Write-Host -ForegroundColor Yellow -NoNewline "[*] Full Domain Name: "; $domainName=Read-Host
Write-Host -ForegroundColor Yellow -NoNewline "`n[*] GPO Name: "; $gpo=Read-Host

## Instalamos el modulo necesario
Install-Module -Name GPRegistryPolicy

## Buscamos el GUID de la GPO
$gpoGuid = (Get-GPO -Name "$gpo").Id.ToString()

## Buscamos el fichero registry.pol 
$registryPolPath = "\\$(hostname)\sysvol\$domainName\Policies\{$gpoGuid}\Machine"
$regPolPath = Join-Path -Path $registryPolPath -ChildPath 'registry.pol'

#Comprobar si es clave de maquina o usuario
if ( Test-Path -Path $regPolPath ) {
    Clear-Host; Write-Host -ForegroundColor Yellow "`n[*] Getting KeyName and Values" 
    Parse-PolFile -Path $regPolPath
} else {
    $registryPolPath = "\\$(hostname)\sysvol\$domainName\Policies\{$gpoGuid}\User"
    $regPolPath = Join-Path -Path $registryPolPath -ChildPath 'registry.pol'
    Clear-Host; Write-Host -ForegroundColor Yellow "`n[*] Getting KeyName and Values" 
    Parse-PolFile -Path $regPolPath
}
