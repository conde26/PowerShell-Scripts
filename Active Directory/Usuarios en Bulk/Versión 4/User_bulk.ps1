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
Write-host -ForegroundColor yellow -NoNewline "`n[!] Added User: "; Write-host -ForegroundColor Green "$($_.name.ToUpper())`n"
Write-Host -ForegroundColor Yellow -NoNewline "`t[*] Name: "; Write-host -ForegroundColor Green "$($_.name)"
Write-Host -ForegroundColor Yellow -NoNewline "`t[*] Password: " ; Write-host -ForegroundColor Green "$($_.password)"
Write-Host -ForegroundColor Yellow -NoNewline "`t[*] UID: " ; Write-host -ForegroundColor Green "$($_.uid)"
Write-Host -ForegroundColor Yellow -NoNewline "`t[*] GUID: " ; Write-host -ForegroundColor Green "$($_.guid)"
Write-Host -ForegroundColor Yellow -NoNewline "`t[*] UnixHome: "; Write-host -ForegroundColor Green "$($_.home)"
}
