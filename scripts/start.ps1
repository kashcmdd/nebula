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

& (Join-Path $root ".venv\Scripts\redbot.exe") $Instance
