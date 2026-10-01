#Requires -Version 5.1
<#
.SYNOPSIS
    Reproducibly create the Red-DiscordBot virtual environment and install Red.

.DESCRIPTION
    Creates a Python 3.11 virtual environment at the repo root and installs
    Red-DiscordBot into it.

    Red 3.5.x declares `python_requires = ">=3.8.1,<3.12"`, so we pin to 3.11.
    Do NOT install Red into a 3.12+ environment; the install will not behave.

    We deliberately use a standard venv (with pip) rather than `uv tool`/`pipx`,
    because Red installs cog dependencies into its own environment at runtime
    via pip. uv's pip-less tool environments can break `[p]cog install`.

.NOTES
    Idempotent: safe to re-run. It will upgrade Red to the latest release.
#>
[CmdletBinding()]
param(
    [string]$PythonVersion = "3.11",
    [string]$VenvPath = ".venv"
)

$ErrorActionPreference = "Stop"

# Repo root is the parent of this script's folder.
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (Test-Path $VenvPath) {
    Write-Host "Virtual environment already exists at $VenvPath"
}
else {
    if (Get-Command uv -ErrorAction SilentlyContinue) {
        Write-Host "Creating venv with uv (Python $PythonVersion)..."
        uv venv --seed --python $PythonVersion $VenvPath
    }
    elseif (Get-Command py -ErrorAction SilentlyContinue) {
        Write-Host "uv not found; creating venv with the py launcher..."
        py "-$PythonVersion" -m venv $VenvPath
    }
    else {
        throw "Neither 'uv' nor the 'py' launcher was found. Install uv or Python $PythonVersion first."
    }
}

$python = Join-Path $root "$VenvPath\Scripts\python.exe"

Write-Host "Upgrading pip..."
& $python -m pip install --upgrade pip

Write-Host "Installing Red-DiscordBot..."
& $python -m pip install --upgrade Red-DiscordBot

Write-Host ""
Write-Host "Installed version:"
& $python -m pip show Red-DiscordBot | Select-String '^Version'
