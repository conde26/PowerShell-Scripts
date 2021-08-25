#Script para cambiar el nombre de nuestro equipo
#Autor: Jose Conde 

#Personalización de ventana y los colores de la terminal
$Host.UI.RawUI.WindowTitle = "Cambio Nombre Equipo"
$Host.UI.RawUI.ForegroundColor = "green"
$Host.UI.RawUI.BackgroundColor = "black"; Clear-Host

#Nombre equipo antiguo 
Write-Host "[!] El nombre actual de tu equipo es: " -ForegroundColor Yellow -NoNewline; Write-Host $env:COMPUTERNAME -ForegroundColor Green 

#Nombre equipo nuevo
Write-Host ''
Write-Host "[*] Indica el nombre nuevo para tu equipo: " -ForegroundColor Yellow -NoNewline;$nombre= Read-Host

#Cambiando nombre equipo
Rename-Computer $nombre 3>$null

#Condicional if, para aplicar cambios
Clear-Host; Write-Host "[?] Quieres reinciar el equipo ahora para aplicar cambios? [s/n]: " -ForegroundColor Yellow -NoNewline;$respuesta= Read-Host

if ( $respuesta -eq "s" ) 
    {
        Clear-Host; Write-Host "[!] Vamos a reiniciar tu equipo en 2 segundos" -ForegroundColor Yellow; Start-Sleep -Seconds 2
        Restart-Computer
    }
elseif( $respuesta -eq "n" )
    {
        Clear-Host; Write-Host "[!] Okay, no te olvides de hacerlo luego!" -ForegroundColor yellow
        pause
    }
else
    {
        Write-Host "[!] Respuesta no valida!" -ForegroundColor Red
        pause
    }

