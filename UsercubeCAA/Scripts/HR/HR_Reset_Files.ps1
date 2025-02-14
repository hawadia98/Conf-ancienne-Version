<#
.SYNOPSIS
None.

.DESCRIPTION
None.
#>

# Include the script located at the specified path.
$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

$hrPath = Join-Path -Path $applicationPath -ChildPath "Sources\RH"

Get-ChildItem $hrPath -Depth 0 -Filter *.csv |
Foreach-Object {
    $header = Get-Content $_.FullName | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
    Set-Content $_.FullName -Value $header
}

# Reset Load IUG file
$loadIUGFile = Join-Path -Path $applicationPath -ChildPath "Sources\Paie\Load_IUG.csv"
$loadIUGHeader = Get-Content $loadIUGFile | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
Set-Content $loadIUGFile -Value $loadIUGHeader
