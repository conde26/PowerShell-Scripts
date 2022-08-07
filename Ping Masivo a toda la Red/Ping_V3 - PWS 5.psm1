#!/usr/bin/pwsh 
#Author: Conde 


function Get-ActiveComputers {
	<#
	.SYNOPSIS
		Scanning active computers on the network.
	
	.DESCRIPTION
		This tool is created to scan ranges of a subnet, in order to obtain the 
		equipment connected to it.
	  
		By Conde.
	
	.EXAMPLE
	 
	 #Get Active computers via CLI 
	 Get-ActiveComputers -Subnet 10.10.0 -StartIP 50 -EndIp 100
	 
	 #Get active computers with output via GUI
	 Get-ActiveComputers -Subnet 10.10.0 -StartIP 10 -EndIp 20 -DisplayGUIResult
	
	.LINK
	https://github.com/conde26
	https://rinconh4ck.blogspot.com/
	https://linkedin.com/in/jose-conde-garcia 
	https://h4cktrick.github.io/
	#>




    Param(
        [Parameter(Position=0,mandatory=$true)]
        [string]$Subnet,
        [Parameter(Position=1,mandatory=$true)]
        [string]$StartIp,
        [Parameter(Position=2,mandatory=$true)]
        [string]$EndIp,
        [Parameter(Position=3,mandatory=$false)]
        [Switch]$DisplayGUIResult
    )

$parametros_echo = @{
        f = "Yellow"
        b = "Black"
}

$parametros_ping = @{
    Count = "1"
    Quiet = $null

}

    $up_computers=@()
    $StartIP..$EndIp | % {
        $status = Test-Connection "$Subnet.$_" @parametros_ping 

        if($status){
            write-host @parametros_echo "[*] $Subnet.$_ - Activo"
            $up_computers += "$Subnet.$_"
        }

    }
    
    if($DisplayGUIResult){
        $up_computers | Out-GridView -Title "Lista De Equipos Activos"
    }    
    
}