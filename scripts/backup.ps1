#Requires -Version 5.1
<#
.SYNOPSIS
    Back up an instance's data using Red's built-in backup command.

.DESCRIPTION
    Wraps `redbot-setup backup` and prunes old backups, keeping the most recent
    $Keep. Backups land in /backups (gitignored) with a timestamp per run.

    For a consistent snapshot, prefer running this while the bot is stopped.
    The JSON backend copies whole files; a live write during the copy could
    produce a torn file. SQLite-backed deployments should use the same command
    (Red takes a proper copy).
#>
[CmdletBinding()]
param(
    [string]$Instance = "nebula",
    [string]$DestinationRoot,
    [int]$Keep = 14
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $DestinationRoot) { $DestinationRoot = Join-Path $root "backups" }
New-Item -ItemType Directory -Force -Path $DestinationRoot | Out-Null

$setup = Join-Path $root ".venv\Scripts\redbot-setup.exe"
if (-not (Test-Path $setup)) { throw "redbot-setup not found. Run scripts/install.ps1 first." }

$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$dest = Join-Path $DestinationRoot $stamp

Write-Host "Backing up '$Instance' to $dest ..."
& $setup backup $Instance $dest
if ($LASTEXITCODE -ne 0) { throw "Backup failed with exit code $LASTEXITCODE" }

# Prune: keep the newest $Keep timestamped folders.
$old = Get-ChildItem $DestinationRoot -Directory |
    Sort-Object Name -Descending |
    Select-Object -Skip $Keep
foreach ($d in $old) {
    Remove-Item $d.FullName -Recurse -Force
    Write-Host "Pruned old backup $($d.Name)"
}

Write-Host "Done."
