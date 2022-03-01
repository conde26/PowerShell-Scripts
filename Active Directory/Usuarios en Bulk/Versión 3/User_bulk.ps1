#Add users in bulk 
#Author: Jose Conde 
 
#Get content from file
$users = Import-Csv -Delimiter ","  usuarios.csv

#Import user from csv 
foreach ($user in $users){

#Add user with properties    
New-ADUser $($user.name) -AccountPassword $(ConvertTo-SecureString $($user.password) -AsPlainText -Force) `
                 -HomeDirectory \\$(hostname)\Carpetas_Personales\$($user.name) `
                 -HomeDrive Z: `
                 -ProfilePath \\$(hostname)\Perfiles_Moviles\$($user.name) `
                 -PasswordNeverExpires $true `
                 -Enabled $true `
                 -ScriptPath inicio.bat `

#Modify UID and GUID
Set-ADUser $($user.name) -Add @{uidnumber=$($user.uid); gidnumber=$($user.guid)}

#Print verify message
Write-Host "$($user.name) - Ok!" -ForegroundColor Green
}
