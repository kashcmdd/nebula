#Requires -Version 5.1
<#
.SYNOPSIS
    Resolve executables inside the repository's virtual environment.

.DESCRIPTION
    A virtualenv lays its console scripts out differently per platform:
    Windows uses .venv\Scripts\ with .exe suffixes, POSIX uses .venv/bin/
    without them. Every script that shells out to redbot, redbot-setup or
    python should resolve through here instead of hardcoding a layout.

    Dot-source this file, then call Get-VenvExe / Get-VenvPython:

        . (Join-Path $PSScriptRoot "lib/venv.ps1")
        $redbot = Get-VenvExe -Name "redbot"
#>

$script:OnWindows = $env:OS -eq "Windows_NT"
# This file lives in <root>/scripts/lib, so the repo root is two levels up.
$script:VenvRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

function Get-VenvBinDir {
    param([string]$Root = $script:VenvRoot)

    $venv = Join-Path $Root ".venv"
    if ($script:OnWindows) { Join-Path $venv "Scripts" } else { Join-Path $venv "bin" }
}

function Get-VenvExe {
    <#
    .SYNOPSIS
        Absolute path to a venv console script, with the platform suffix applied.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [string]$Root = $script:VenvRoot
    )

    $dir = Get-VenvBinDir -Root $Root
    $file = if ($script:OnWindows) { "$Name.exe" } else { $Name }
    $path = Join-Path $dir $file

    if (-not (Test-Path $path)) {
        throw "'$file' not found in '$dir'. Run scripts/install.ps1 first."
    }
    $path
}

function Get-VenvPython {
    param([string]$Root = $script:VenvRoot)
    Get-VenvExe -Name "python" -Root $Root
}

function Get-RedbotProcess {
    <#
    .SYNOPSIS
        Running redbot processes for an instance, or nothing if none.

    .DESCRIPTION
        On Windows the console script runs as redbot.exe, so the process name
        matches. On POSIX it is a Python script, so match the command line.
    #>
    param([string]$Instance = "nebula")

    if ($script:OnWindows) {
        Get-Process redbot -ErrorAction SilentlyContinue
        return
    }

    $ids = & pgrep -f "redbot $Instance" 2>$null
    foreach ($id in $ids) {
        Get-Process -Id $id -ErrorAction SilentlyContinue
    }
}
