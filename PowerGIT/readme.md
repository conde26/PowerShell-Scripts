# Github API Module 


## Prerequisites
<br>

First of all, we will need to install GIT on our computer since the module combines the API and GIT. 

* [Donwload GIT](https://git-scm.com/downloads) 

<br>

## Installation 

<br>

We start by downloading the repository. 

```bash
git clone "https://github.com/conde26/PowerShell-Scripts"
```

Once the powershell repository is downloaded, we go to the "Github API" path.

```bash
cd "Powershell-scripts\Github API"
```

Finally we import the module, and we can use the functions contained in the module.  

```powershell
Import-module PowerGIT.psm1
```

<br>

## Use

<br>

Donwload all repos from user. 

```powershell
Get-GitRepoFromUser -Username <GitHub User> -Path <Folder to storage>
```

Sync local repo with remote, to up and donwload new changes. 

```powershell
Sync-GitRepo -Folder <Local repo> -Remote <Origin> -Commit "Commit Message" -Branch <master>
```

