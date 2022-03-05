# Instalación y Promoción del AD
## Autor: Jose Conde 

Lo principal será ejecutar este script que nos creará nuestro controlador de dominio de Active Directory. Dentro del debemos modificar una serie de parametros, ya que depende del dominio que quieras crear, estos son:
- **DomainName** -> Indicas el nombre de dominio completo 
- **DomainNetbiosName** -> Indicas el nombre netbios del dominio (Sin la terminación)
- **SafeModeAdministratorPassword** -> Indicas la contraseña segura para el administrador del dominio (Es de recuperación, no de inicio de sesión)
