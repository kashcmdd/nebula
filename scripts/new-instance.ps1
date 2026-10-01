#Requires -Version 5.1
<#
.SYNOPSIS
    Create a Red-DiscordBot instance non-interactively.

.DESCRIPTION
    Wraps `redbot-setup` in non-interactive mode so the instance is reproducible
    from source control instead of a series of manual prompts.

    The instance's data directory (which holds the token and databases) is
    placed under /data at the repo root and is gitignored.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InstanceName,

    [string]$DataPath,

    [ValidateSet("json", "postgres")]
    [string]$Backend = "json"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $DataPath) {
    $DataPath = Join-Path $root "data"
}

$setup = Join-Path $root ".venv\Scripts\redbot-setup.exe"
if (-not (Test-Path $setup)) {
    throw "redbot-setup not found. Run scripts/install.ps1 first."
}

Write-Host "Creating instance '$InstanceName' at $DataPath (backend: $Backend)..."
& $setup --no-prompt --instance-name $InstanceName --data-path $DataPath --backend $Backend

Write-Host "Instance created. Configure the token/owner/prefix with scripts/configure.ps1."
