Function Get-GitRepoFromUser {

    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory=$True,
			HelpMessage="Username from github"
        )]
        [string]$Username,
        [Parameter(
            Mandatory=$True,
			HelpMessage="Local Path to storage repositories"
        )]
        [string]$Folder
    )


    $RepositoryListURL = (Invoke-RestMethod https://api.github.com/users/$Username/repos) | Select Name, Clone_url 
    
    $RepositoryListURL | % { 
        
        $RepositoryURL  = $_.Clone_url
        $RepositoryName = $_.Name
        $Path = $Folder + 
                "\" + 
                $RepositoryName

        Write-host -f Yellow -b black "[!] Clonando $RepositoryName"
        Write-host -f cyan -b black "`t[!] Path: $Path"
        git clone $RepositoryURL $Path 2>$null
    }
}