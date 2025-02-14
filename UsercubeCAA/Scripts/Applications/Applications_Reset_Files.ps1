<#
.SYNOPSIS
Reset script Applications CSV.

.DESCRIPTION
None.
#>

# Include the script located at the specified path.
$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

$applinPath = Join-Path -Path $applicationPath -ChildPath "Sources\Applications\Incremental"

Get-ChildItem $applinPath -Depth 0 -Filter *.csv |
Foreach-Object {
    $header = Get-Content $_.FullName | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
    Set-Content $_.FullName -Value $header
}
