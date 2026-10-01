#Requires -Version 5.1
<#
.SYNOPSIS
    Configure owner, prefix and (optionally) the bot token for an instance.

.DESCRIPTION
    Non-interactive configuration wrapper around `redbot <instance> --edit`.

    The token is read with a hidden prompt and never written to disk by this
    script or to shell history. Red stores it in the instance data directory.

.EXAMPLE
    # Set owner + prefix
    ./scripts/configure.ps1 -Instance mybot -Owner 123456789012345678 -Prefix "!" "?"

.EXAMPLE
    # Set/replace the bot token (hidden prompt)
    ./scripts/configure.ps1 -Instance mybot -Token
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Instance,

    [string]$Owner,

    [string[]]$Prefix,

    [switch]$Token
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$redbot = Join-Path $root ".venv\Scripts\redbot.exe"
if (-not (Test-Path $redbot)) {
    throw "redbot not found. Run scripts/install.ps1 first."
}

$redArgs = @($Instance, "--edit", "--no-prompt")

if ($Owner) { $redArgs += @("--owner", $Owner) }
if ($Prefix) { foreach ($p in $Prefix) { $redArgs += @("--prefix", $p) } }

$plain = $null
try {
    if ($Token) {
        $secure = Read-Host "Paste the bot token (input hidden)" -AsSecureString
        $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
        try { $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr) }
        finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr) }
        $redArgs += @("--token", $plain)
    }

    & $redbot @redArgs
}
finally {
    $plain = $null
}
