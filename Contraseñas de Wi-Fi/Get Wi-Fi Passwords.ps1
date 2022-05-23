#Get Wi-Fi Password from Windows
#Author: Conde

#Get SSID
$wireless_profiles=((netsh wlan show profiles) -match '\s{2,}:\s') -replace '.*:\s' , ''

#Getting info
$wireless_profiles | % {
    #Get Password
	netsh wlan show profile name=$_ key=clear | Select-String “clave\W+\:(.+)$” | % {
        $password=$_.Matches.Groups[1].Value.Trim()
            
    }
	#Get Name and password
    Write-host -NoNewline -ForegroundColor Green "`n[*] $_ :"; Write-Host -ForegroundColor red " $password`n" 
}

