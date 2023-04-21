#Get functions definition files.
$Functions = @( Get-ChildItem -Recurse -Path $PSScriptRoot\Functions\Public\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach ($import in $Functions) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}