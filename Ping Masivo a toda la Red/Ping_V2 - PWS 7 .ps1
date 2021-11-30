#Script para comprobar equipos disponibles en PWS 7
#Autor: Jose Conde

#Ping Multihilo - V2
1..254 | ForEach-Object -Parallel {
    $computer = "192.168.0.$_"
    $status = Test-Connection $computer -count 1 -Quiet 
    
    if ($status -eq "True")
    {
        Write-Host "[!] Equipo: $computer" -ForegroundColor Yellow -NoNewline; Write-Host " - Encendido"  -ForegroundColor Green
    }
} -ThrottleLimit 100
