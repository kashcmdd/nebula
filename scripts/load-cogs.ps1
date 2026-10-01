#Requires -Version 5.1
<#
.SYNOPSIS
    Persist the set of cogs that an instance loads at startup.

.DESCRIPTION
    Red stores the list of cogs to load at startup in the core config at
    data/core/settings.json, under <identifier>/GLOBAL/packages. Fresh
    instances start with an empty list, so every feature cog must be loaded
    once (the in-Discord equivalent is:  !load admin alias ...).

    This script writes that same list directly so a fresh deployment can be
    configured unattended. It backs the config up first and is idempotent.

    The cog list is read from config/cogs.txt.
#>
[CmdletBinding()]
param(
    [string]$DataPath,
    [string]$CogListPath
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $DataPath) { $DataPath = Join-Path $root "data" }
if (-not $CogListPath) { $CogListPath = Join-Path $root "config\cogs.txt" }

$settings = Join-Path $DataPath "core\settings.json"
if (-not (Test-Path $settings)) { throw "Core settings not found at $settings" }
if (-not (Test-Path $CogListPath)) { throw "Cog list not found at $CogListPath" }

# Read the cog list, ignoring blanks and comments.
$cogs = Get-Content $CogListPath |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -and -not $_.StartsWith("#") }

if (-not $cogs) { throw "No cogs found in $CogListPath" }

# Build a JSON array literal: ["admin", "alias", ...]
$array = "[" + (($cogs | ForEach-Object { '"' + $_ + '"' }) -join ", ") + "]"

Copy-Item $settings "$settings.bak" -Force
$raw = Get-Content $settings -Raw

if ($raw -match '"packages"\s*:\s*\[[^\]]*\]') {
    $updated = $raw -replace '"packages"\s*:\s*\[[^\]]*\]', ('"packages": ' + $array)
}
else {
    $updated = $raw -replace '"GLOBAL"\s*:\s*\{', ('"GLOBAL": {"packages": ' + $array + ', ')
}

if ($updated -eq $raw) { throw "Failed to update the packages list (target pattern not found)" }

# Write without a BOM so Python's json loader is happy.
[System.IO.File]::WriteAllText($settings, $updated, (New-Object System.Text.UTF8Encoding($false)))

Write-Host "Wrote $($cogs.Count) cogs to $settings"
$cogs | ForEach-Object { Write-Host "  - $_" }
Write-Host "Backup saved to $settings.bak"
