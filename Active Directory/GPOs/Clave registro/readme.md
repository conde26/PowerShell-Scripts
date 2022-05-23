# Encontrar Clave Registro GPO
## Author: Conde 

El siguiente script, nos permite conseguir las claves de registro de las directivas aplicadas para 
una GPO. Todo esto para realizar una automatización de ellas con powershell, vbs, etc. 

### Observaciones
Contamos con dos versiones para este script. 
- **Version 1** (Esta pide por pantalla las variables necesarias)
- **Version 2** (Este no pide por pantalla si no que lo pasamos como parámetros, a mayores comprueba si dispones ya del modulo necesario para que funcione el script)

#### Ejemplo de uso de versión 2 
```powershell 
Clave_Registro_GPO_2.ps1 -domainName hacking.local -gpo SMBRelay
```
