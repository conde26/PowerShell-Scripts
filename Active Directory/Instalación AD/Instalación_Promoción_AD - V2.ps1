#Scripts Instalación AD 
#Author: Jose Conde 

#Propiedades en hastable
$Propiedades = @{
    domain = "dominio.com"
    netbios = "dominio"
    password = "strong&P4$$W0RD"
}

#Instalamos rol Active Directory
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Instalamos nuevo bosque y dominio 
Install-ADDSForest -DomainMode "Win2012" `
				   -ForestMode "Win2012" `
				   -DomainName "$($Propiedades.domain)" `
				   -DomainNetbiosName "$($Propiedades.netbios)" `
				   -SafeModeAdministratorPassword (ConvertTo-SecureString -string "$($Propiedades.password)" -AsPlainText -Force) `
				   -InstallDns:$true -CreateDnsDelegation:$false `
				   -DatabasePath "C:\Windows\NTDS" `
				   -LogPath "C:\Windows\NTDS" `
				   -SysvolPath "C:\Windows\SYSVOL" `
				   -NoRebootOnCompletion:$false `
				   -Force:$true `
				   
#Reinciamos equipo, para aplicar cambios		  
restart-computer
