# Automatizar GPOs
## Author: Jose Conde 

En este apartado, podrás encontrar algunas de las GPOs más comunes de forma automatizada con PowerShell. Antes de automatizarlas, necesitamos saber la clave del registro de dicha GPO, por ello cree un script la cual nos dice la clave que tiene asocidad la GPO. Los pasos a seguir serían los siguientes:

### Pasos a seguir

1. Creamos la GPO manualmente
2. Ejecutamos el [script](https://github.com/conde26/PowerShell-Scripts/blob/main/Active%20Directory/GPOs/Clave%20registro/Clave_Registro_GPO.ps1) para encontrar la clave del registro de la GPO que queremos automatizar
3. Creamos el script indicando los valores que nos devuelve el anterior script


