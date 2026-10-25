#Requires -Version 5.1
<#
.SYNOPSIS
    Store a Red shared API token (e.g. the DeepSeek key) without using Discord.

.DESCRIPTION
    Prompts for the value with hidden input and writes it via Red's own config
    driver (tools/set_api_key.py), in the same shape as `[p]set api`. The key
    never appears in Discord, shell history, or this repository.

    Red caches config in memory, so the bot is stopped before writing and
    restarted afterwards (unless -SkipRestart).

.EXAMPLE
    ./scripts/set-api-key.ps1                      # service defaults to deepseek
    ./scripts/set-api-key.ps1 -Service youtube
#>
[CmdletBinding()]
param(
    [string]$Instance = "nebula",
    [string]$Service = "deepseek",
    [string]$TokenName = "api_key",
    [switch]$SkipRestart
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

. (Join-Path $PSScriptRoot "lib/venv.ps1")
$python = Get-VenvPython

$wasRunning = $false
$running = Get-RedbotProcess -Instance $Instance
if ($running) {
    $wasRunning = $true
    $running | Stop-Process -Force
    Start-Sleep -Seconds 2
}

& $python (Join-Path $root "tools\set_api_key.py") $Instance $Service $TokenName

if ($wasRunning -and -not $SkipRestart) {
    $logDir = Join-Path $root "logs"
    New-Item -ItemType Directory -Force -Path $logDir | Out-Null
    $startArgs = @{
        FilePath               = Get-VenvExe -Name "redbot"
        ArgumentList           = $Instance
        RedirectStandardOutput = (Join-Path $logDir "$Instance.out.log")
        RedirectStandardError  = (Join-Path $logDir "$Instance.err.log")
    }
    # -NoNewWindow is a Windows-only switch; POSIX always spawns detached.
    if ($script:OnWindows) { $startArgs.NoNewWindow = $true }
    Start-Process @startArgs
    Write-Host "Restarted $Instance."
}
elseif (-not $SkipRestart) {
    Write-Host "Bot was not running; start it with ./scripts/start.ps1"
}
