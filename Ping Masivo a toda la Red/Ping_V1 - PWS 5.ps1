#Script para comprobar equipos disponibles
#Autor: Jose Conde

ForEach ($ip in 1..254) 
{
    $computer = "192.168.1.$ip"
    $status = Test-Connection $computer -count 1 -Quiet 
    
    if ($status -eq "True")
    {
        Write-Host "[!] Equipo: $computer" -ForegroundColor Yellow -NoNewline; Write-Host " - Encendido"  -ForegroundColor Green
    }
    else
    {
        Write-Host "[!] Equipo: $computer" -ForegroundColor Yellow -NoNewline; Write-Host  " - Apagado"  -ForegroundColor Red

    }
}
