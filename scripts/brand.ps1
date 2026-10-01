#Requires -Version 5.1
<#
.SYNOPSIS
    Apply Nebula's brand settings to an instance's core config.

.DESCRIPTION
    Sets the global embed colour, the bot description and the help tagline from
    config/branding.json. These map to the same values as the in-Discord
    commands:
        [p]set colour <hex>          -> color
        [p]set description <text>    -> description
        [p]helpset tagline <text>    -> help.tagline

    The config is backed up to <settings>.bak before writing and the value is
    written without a BOM so Red's JSON loader is happy.
#>
[CmdletBinding()]
param(
    [string]$DataPath,
    [string]$BrandingPath
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $DataPath) { $DataPath = Join-Path $root "data" }
if (-not $BrandingPath) { $BrandingPath = Join-Path $root "config\branding.json" }

$settings = Join-Path $DataPath "core\settings.json"
if (-not (Test-Path $settings)) { throw "Core settings not found at $settings" }
if (-not (Test-Path $BrandingPath)) { throw "Branding file not found at $BrandingPath" }

function Set-Prop($obj, $name, $value) {
    if ($obj.PSObject.Properties.Name -contains $name) { $obj.$name = $value }
    else { $obj | Add-Member -NotePropertyName $name -NotePropertyValue $value }
}

$brand = Get-Content $BrandingPath -Raw | ConvertFrom-Json

Copy-Item $settings "$settings.bak" -Force
$cfg = Get-Content $settings -Raw | ConvertFrom-Json

$scope = $cfg.PSObject.Properties.Name | Select-Object -First 1
$global = $cfg.$scope.GLOBAL
if ($null -eq $global) { throw "GLOBAL scope not found in $settings" }

if ($brand.PSObject.Properties.Name -contains 'color') {
    Set-Prop $global 'color' $brand.color
}
if ($brand.PSObject.Properties.Name -contains 'description') {
    Set-Prop $global 'description' $brand.description
}
if ($brand.PSObject.Properties.Name -contains 'help') {
    if ($global.PSObject.Properties.Name -contains 'help') { $help = $global.help }
    else { $help = New-Object psobject; Set-Prop $global 'help' $help }
    if ($brand.help.PSObject.Properties.Name -contains 'tagline') {
        Set-Prop $help 'tagline' $brand.help.tagline
    }
}

$json = $cfg | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($settings, $json, (New-Object System.Text.UTF8Encoding($false)))

Write-Host "Applied branding to $settings"
Write-Host "  color       : $($brand.color)"
Write-Host "  description : $($brand.description)"
Write-Host "  help.tagline: $($brand.help.tagline)"
Write-Host "Backup saved to $settings.bak"
