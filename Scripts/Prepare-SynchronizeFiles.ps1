#

$demoPath = Split-Path $PSScriptRoot -Parent
$sourcePath = Join-Path -Path $demoPath -ChildPath 'Temp/ExportOutput'
$synchronizeFiles = Join-Path -Path $sourcePath -ChildPath 'SynchronizationFiles' 
$indexFile = Join-Path -Path $synchronizeFiles -ChildPath 'index.txt'

if(!(Test-Path $indexFile))
{
    New-Item -Path $synchronizeFiles -Name 'index.txt' -Value '1'
}

$index = Get-Content -Path $indexFile -TotalCount 1

$daysFiles = Join-Path -Path $synchronizeFiles -ChildPath "day$index"
Copy-Item -Path ($daysFiles + "\*") -Destination $sourcePath -Force
$index = $index -as [int]
Set-Content -Path $indexFile -Value ($index + 1)

#
