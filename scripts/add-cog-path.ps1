#Requires -Version 5.1
<#
.SYNOPSIS
    Register a directory as a Red cog path.

.DESCRIPTION
    Persists a cog path the same way `[p]addpath` does, by writing the
    CogManager core config (data/cogs/CogManager/settings.json). Lets a fresh
    deployment discover local cogs without manual Discord commands.

    The bot must be stopped, so this script is safe to run before startup.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [string]$DataPath
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $DataPath) { $DataPath = Join-Path $root "data" }

$resolved = (Resolve-Path $Path).Path
$settings = Join-Path $DataPath "cogs\CogManager\settings.json"
$identifier = "2938473984732"   # CogManager's Config identifier

function Set-Prop($obj, $name, $value) {
    if ($obj.PSObject.Properties.Name -contains $name) { $obj.$name = $value }
    else { $obj | Add-Member -NotePropertyName $name -NotePropertyValue $value }
}

$raw = if (Test-Path $settings) { Get-Content $settings -Raw } else { "" }
$cfg = if ($raw -and $raw.Trim()) { $raw | ConvertFrom-Json } else { New-Object psobject }

if (-not ($cfg.PSObject.Properties.Name -contains $identifier)) {
    Set-Prop $cfg $identifier (New-Object psobject)
}
$idObj = $cfg.$identifier
if (-not ($idObj.PSObject.Properties.Name -contains "GLOBAL")) {
    Set-Prop $idObj "GLOBAL" (New-Object psobject)
}
$global = $idObj.GLOBAL

$paths = @()
if ($global.PSObject.Properties.Name -contains "paths") { $paths = @($global.paths) }
if ($paths -notcontains $resolved) { $paths += $resolved }
Set-Prop $global "paths" $paths

New-Item -ItemType Directory -Force -Path (Split-Path -Parent $settings) | Out-Null
if (Test-Path $settings) { Copy-Item $settings "$settings.bak" -Force }

$json = $cfg | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($settings, $json, (New-Object System.Text.UTF8Encoding($false)))

Write-Host "Registered cog path: $resolved"
Write-Host "Cog paths now: $(@($paths) -join '; ')"
