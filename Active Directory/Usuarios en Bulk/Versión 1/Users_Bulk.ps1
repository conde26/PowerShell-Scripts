#Add users in bulk 
#Author: Jose Conde 
 
#Get content from file
$file = gc .\usuarios.txt
$pass = Read-Host "Indica la contraseña base"

#Add user in bulk
foreach ($i in $file ){

$user = $i.split(',')[0]
$uid = $i.split(',')[1]
$guid = $i.split(',')[2]



New-ADUser $user -AccountPassword $(ConvertTo-SecureString $pass -AsPlainText -Force) `
                 -HomeDirectory \\$(hostname)\Carpetas_Personales\$user `
                 -HomeDrive Z: `
                 -ProfilePath \\$(hostname)\Perfiles_Moviles\$user `
                 -PasswordNeverExpires $true `
                 -Enabled $true `
                 -ScriptPath inicio.bat `

Set-ADUser $user -Add @{uidnumber=$uid; gidnumber=$guid}


Write-Host "$user - Ok!" -ForegroundColor Green
}