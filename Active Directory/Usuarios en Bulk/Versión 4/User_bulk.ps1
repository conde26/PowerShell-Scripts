#Add users in bulk 
#Author: Conde 

if(! $args[0]){
    write-host -ForegroundColor Red "`n[*] Uso: ./script.ps1 file.csv"
    exit 1
}
 
#Get content from file
Import-Csv -Delimiter ","  $args[0] |  % {

#Add user with properties    
New-ADUser $($_.name) -AccountPassword $(ConvertTo-SecureString $($_.password) -AsPlainText -Force) `
                 -HomeDirectory \\$(hostname)\Carpetas_Personales\$($_.name) `
                 -HomeDrive Z: `
                 -ProfilePath \\$(hostname)\Perfiles_Moviles\$($_.name) `
                 -PasswordNeverExpires $true `
                 -Enabled $true `
                 -ScriptPath inicio.bat `

#Add Unix Atributes
Set-ADUser $($_.name) -Add @{uidnumber=$($_.uid); 
                             gidnumber=$($_.guid); 
                             unixHomeDirectory=$($_.home)
                            }

#Print verify message
Write-Host "$($_.name) - Ok!" -ForegroundColor Green}