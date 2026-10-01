#Requires -Version 5.1
<#
.SYNOPSIS
    Upgrade Red to the latest release.

.DESCRIPTION
    Upgrades the Red-DiscordBot package inside the instance virtualenv, then
    prints the new version. The bot must be restarted afterwards for the new
    code to load. Third-party cogs are updated separately from Discord with
    `[p]cog update`.

    Because Red is installed as a dependency (not vendored/forked), upgrades are
    simply a re-install — there is no merge to perform.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$python = Join-Path $root ".venv\Scripts\python.exe"
if (-not (Test-Path $python)) { throw "Virtualenv not found. Run scripts/install.ps1 first." }

Write-Host "Upgrading Red-DiscordBot..."
& $python -m pip install --upgrade Red-DiscordBot

Write-Host ""
Write-Host "Installed now:"
& $python -m pip show Red-DiscordBot | Select-String '^Version'

Write-Host ""
Write-Host "Restart the bot to load the new version."
Write-Host "For third-party cogs, run in Discord:  [p]cog update"
