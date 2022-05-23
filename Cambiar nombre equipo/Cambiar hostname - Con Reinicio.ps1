#Script para cambiar el nombre de nuestro equipo
#Autor: Conde 

#Parameters
param(
    $nombre
)

#Cambiando nombre equipo
Rename-Computer $nombre 3>$null
Restart-Computer 
