<#
.SYNOPSIS
    Recopilación de información de hosts de la red.

.DESCRIPTION
    Esta herramienta esta creada para recopilar informacicón prinicipalmente sobre los equipos de nuestro 
    red local. Tambien pudiendo obtener información de equipo de fuera de nuestra LAN, pero podemos no
    obtener toda la info necesaria.
  
    By Jose Conde.

.EXAMPLE
 HostInfo.ps1 -ip 192.168.65.12 -p 22,80,443

.LINK
https://github.com/conde26
https://rinconh4ck.blogspot.com/

#>


#Párametros herramienta
param(
    [Parameter(Position = 0, Mandatory=$true)][ValidatePattern("\d{1,3}(\.\d{1,3}){3}")][string]$ip,
    [Parameter(Position = 1, Mandatory=$false)][int[]]$p=@()

)

#Variables Globales
$conex = Test-Connection $ip -Count 1 -Quiet
Start-Sleep -Seconds 1
$ttl = (Test-Connection $ip -Count 1).ResponseTimeToLive
Start-Sleep -Seconds 1
$nom = ([System.Net.Dns]::GetHostbyAddress("$ip")).Hostname
Start-Sleep -Seconds 1
$mac = (gwmi -ComputerName $nom -Class Win32_NetworkAdapterConfiguration).MACAddress 2>$null

#Funciones Herramienta
#Funcion TTL 
function ttl {
    #Linux
    if ($ttl -gt 0 -and $ttl -le 64){
        Write-Host -ForegroundColor Green "Linux"
    }
    #Windows
    elseif (($ttl -gt 65 -and $ttl -le 128)){
        Write-Host -ForegroundColor Green "Windows"
    } 
    #Desconocido
    else {
        Write-Host -ForegroundColor Green "Desconocido"
    }
}

#Funcion Mac
function mac {
    if ($mac) {
          Write-Host "`t[*] MAC Address: "-ForegroundColor Yellow -NoNewline
          Write-Host -ForegroundColor Green $mac
    }
    elseif ($mac -eq "" -or $mac -eq $null ){
        Write-Host "`t[*] MAC Address: "-ForegroundColor Yellow -NoNewline
        Write-Host -ForegroundColor Red "Desconocida" 
    }
}

#Funcion Puertos
function puertos {
    foreach ($puerto in $p) 
    {
        $estado = Test-NetConnection $ip -Port $puerto  -WarningAction SilentlyContinue
            if ($estado.TcpTestSucceeded -eq "True") {
                Write-Host "`t`t[!] Puerto $($puerto): "  -ForegroundColor Yellow -NoNewline; Write-Host "Abierto" -ForegroundColor Green
            } 
            else {
                Write-Host "`t`t[!] Puerto $($puerto): " -ForegroundColor Yellow -NoNewline; Write-Host "Cerrado" -ForegroundColor Red
            }
    }
}

#Funcion verdadera
function correcto {
    Write-Host "[!] Obteniendo información de $ip" -ForegroundColor Yellow 
        For ($i=0; $i -le 100; $i++) {
            Start-Sleep -Milliseconds 20
            Write-Progress -Activity "Obteniendo información del sistema" -Status "Enviando paquetes a $ip"  -PercentComplete $i
       }
       
       #Comprobaciones
       Write-Host "`n`t[*] Hostname: "-ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Green "$nom" 
       Write-Host "`t[*] Ip: " -ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Green "$ip"
       Write-Host "`t[*] Status: " -ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Green "Activo"
       Write-Host "`t[*] Operating System: "-ForegroundColor Yellow -NoNewline; ttl
       mac
       Write-Host "`t[*] Puertos: "-ForegroundColor Yellow; puertos

}

#Funcion falsa
function incorrecto {
    Write-Host "[!] Obteniendo información de $ip" -ForegroundColor Yellow 
        For ($i=0; $i -le 100; $i++) {
            Start-Sleep -Milliseconds 20
            Write-Progress -Activity "Obteniendo información del sistema" -Status "Enviando paquetes a $ip"  -PercentComplete $
        }

        #Comprobaciones
        Write-Host "`n`t[*] Hostname: "-ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Red "Desconocido" 
        Write-Host "`t[*] Ip: " -ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Green "$ip"
        Write-Host "`t[*] Status: " -ForegroundColor Yellow -NoNewline; Write-Host -ForegroundColor Red "Inactivo"
        Write-Host "`t[*] Operating System: "-ForegroundColor Yellow -NoNewline; ttl
        mac
        Write-Host "`t[*] Puertos: 0"-ForegroundColor Yellow
}


#Flujo del Programa
if ($conex -eq "True"){
    correcto
}
elseif ($conex -eq "False") {
    incorrecto
}
else {
    Write-Host -ForegroundColor Red "[!] IP no valida"
}

