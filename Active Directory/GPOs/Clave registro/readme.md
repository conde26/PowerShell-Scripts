# Encontrar Clave Registro GPO
## Author: Conde 

El siguiente script, nos permite conseguir las claves de registro de las directivas aplicadas para 
una GPO. Todo esto para realizar una automatización de ellas para un futuro. 

### Observaciones
Contamos con dos versiones para este script. 
- Version 1 (Esta pide por pantalla las variables necesarias)
- Version 2 (Este no pide por pantalla si no que lo pasamos como parametros)

### Uso Versión 2 
```powershell 
Clave_Registro_GPO_2.ps1 -domainName hacking.local -gpo SMBRelay
```
