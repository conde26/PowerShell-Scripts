Function Sync-GitRepo {

    [CmdletBinding()]
    param (
       [Parameter(
            Mandatory=$True,
			HelpMessage="Local Folder in your PC"
        )]
        [string]$Folder,
        [Parameter(
            Mandatory=$True,
			HelpMessage="Repository name [example: origin]"
        )]
        [string]$Remote,
        [Parameter(
            Mandatory=$True,
			HelpMessage="Commit message"
        )]
        [string]$CommitMessage,
        [Parameter(
            Mandatory=$True,
			HelpMessage="Branch of repository"
        )]
        [string]$Branch
    )

	git -C $Folder pull $Remote $Branch
	git -C $Folder add .
	git -C $Folder commit -m $CommitMessage
	git -C $Folder push -u $Remote $Branch
}