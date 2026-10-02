#Requires -Version 5.1
<#
.SYNOPSIS
    Supervise the bot: restart it whenever it exits.

.DESCRIPTION
    Runs Red in a loop, restarting it after a short delay if it crashes or is
    closed. Output from every run is appended to logs\<instance>.out.log.

    This is the no-dependency way to keep the bot running (for a true boot-time
    service, see docs/setup.md -> "Running unattended"). To start it at logon,
    place a shortcut to this script in shell:startup.
#>
[CmdletBinding()]
param(
    [string]$Instance = "nebula",
    [int]$RestartDelaySeconds = 10
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# Force UTF-8 so logging never fails on a cp1252 Windows console (emoji etc.).
$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"

$redbot = Join-Path $root ".venv\Scripts\redbot.exe"
$logDir = Join-Path $root "logs"
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$log = Join-Path $logDir "$Instance.out.log"

while ($true) {
    "[run-loop] starting $Instance at $(Get-Date -Format s)" | Out-File $log -Append -Encoding utf8
    & $redbot $Instance *>> $log
    $code = $LASTEXITCODE
    "[run-loop] $Instance exited with code $code; restarting in $RestartDelaySeconds s" |
        Out-File $log -Append -Encoding utf8
    Start-Sleep -Seconds $RestartDelaySeconds
}
