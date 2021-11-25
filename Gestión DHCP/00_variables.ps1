#Variables para WS2019
#Autor: Jose Conde 

#nombre equipo
$env:nombre="winp11"

#Configuración de red 
$env:adaptador="Ethernet"
$env:ip="172.16.210.211"
$env:mask="24"
$env:gateway="172.16.210.1"
$env:dns="172.16.0.58"

#DHCP
$env:ambito="Red-192.168.10.0"
$env:inicio="192.168.10.50"
$env:final="192.168.10.100"
$env:mascara="255.255.255.0"
$env:red="192.168.10.0"
$env:inicio_exclusion="192.168.10.60"
$env:fin_exclusion="192.168.10.70"
$env:dns_ambito="sri.edu"
$env:reserva="192.168.10.54"
$env:mac="F0-DE-F1-7A-00-5E"