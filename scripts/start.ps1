#Requires -Version 5.1
<#
.SYNOPSIS
    Start a Red instance in the foreground.
#>
[CmdletBinding()]
param(
    [string]$Instance = "nebula"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# Force UTF-8 so logging never fails on a cp1252 Windows console (e.g. emoji in
# channel names). Without this, Red's Rich log handler can raise and abort work.
$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"

& (Join-Path $root ".venv\Scripts\redbot.exe") $Instance
