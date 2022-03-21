#Script para comprobar equipos disponibles en la red
#Autor: Jose Conde

1..254 | % {
        $status = Test-Connection 192.168.10.$_ -Count 1 -Quiet

        if ($status){
                  Write-Host "[!] Equipo: 192.168.10.$_" -ForegroundColor Yellow -NoNewline; Write-Host " - Encendido"  -ForegroundColor Green
        }
}
