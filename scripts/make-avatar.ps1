#Requires -Version 5.1
<#
.SYNOPSIS
    Generate Nebula's avatar as a PNG.

.DESCRIPTION
    Draws a violet gradient with a centred "N" and writes assets/nebula-avatar.png.
    Discord crops avatars to a circle, so the mark is kept centred with margin.
    Re-run any time to regenerate; the output path is stable.
#>
[CmdletBinding()]
param(
    [string]$OutputPath,
    [int]$Size = 512,
    [string]$TopColor = "#8B5CF6",
    [string]$BottomColor = "#4C1D95"
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

$root = Split-Path -Parent $PSScriptRoot
if (-not $OutputPath) { $OutputPath = Join-Path $root "assets\nebula-avatar.png" }
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $OutputPath) | Out-Null

$bmp = New-Object System.Drawing.Bitmap($Size, $Size)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$rect = New-Object System.Drawing.Rectangle(0, 0, $Size, $Size)
$c1 = [System.Drawing.ColorTranslator]::FromHtml($TopColor)
$c2 = [System.Drawing.ColorTranslator]::FromHtml($BottomColor)
$brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $c1, $c2, 55.0)
$g.FillRectangle($brush, $rect)

# Subtle vignette ring for depth.
$penColor = [System.Drawing.Color]::FromArgb(40, 255, 255, 255)
$pen = New-Object System.Drawing.Pen($penColor, [Math]::Max(2, $Size / 128))
$margin = $Size * 0.08
$g.DrawEllipse($pen, $margin, $margin, $Size - 2 * $margin, $Size - 2 * $margin)

# Centred "N".
$font = New-Object System.Drawing.Font("Segoe UI", ($Size * 0.56), [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$fmt = New-Object System.Drawing.StringFormat
$fmt.Alignment = [System.Drawing.StringAlignment]::Center
$fmt.LineAlignment = [System.Drawing.StringAlignment]::Center
$white = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$box = New-Object System.Drawing.RectangleF(0, 0, $Size, $Size)
$g.DrawString("N", $font, $white, $box, $fmt)

$g.Dispose()
$bmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

Write-Host "Wrote $OutputPath"
