# PowerGIT

## Description 
<br>

This is a module, which uses the GitHub API and the git command, to automate expensive actions, in order to be able to manage all our actions faster. 

## Prerequisites
<br>

First of all, we will need to install GIT on our computer since the module combines the API and GIT. 

* [Donwload GIT](https://git-scm.com/downloads) 

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

