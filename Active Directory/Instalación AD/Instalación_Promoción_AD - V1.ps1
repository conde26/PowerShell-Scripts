#Scripts Instalación AD 
#Author: Jose Conde 

#Instalamos rol Active Directory
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Instalamos nuevo bosque y dominio 
Install-ADDSForest -DomainMode "Win2012" `
				   -ForestMode "Win2012" `
				   -DomainName "dominio.com" `
				   -DomainNetbiosName "dominio" `
				   -SafeModeAdministratorPassword (ConvertTo-SecureString -string "strong&P4$$W0RD" -AsPlainText -Force) `
				   -InstallDns:$true -CreateDnsDelegation:$false `
				   -DatabasePath "C:\Windows\NTDS" `
				   -LogPath "C:\Windows\NTDS" `
				   -SysvolPath "C:\Windows\SYSVOL" `
				   -NoRebootOnCompletion:$false `
				   -Force:$true `
				   
#Reinciamos equipo, para aplicar cambios		  
restart-computer
