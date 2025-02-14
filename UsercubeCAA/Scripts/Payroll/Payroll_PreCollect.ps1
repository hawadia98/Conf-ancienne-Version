<#
.SYNOPSIS
    Traitement Paie.

.DESCRIPTION
    Traitement Paie pour préparer les fichiers à la synchronisation complète.
#>

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

$payrollPath = Join-Path -Path $applicationPath -ChildPath "Sources\Paie"
$effectifALDFilePath = Join-Path -Path $payrollPath -ChildPath "Effectifs_ALD.csv"
$effectifPresentsFilePath = Join-Path -Path $payrollPath -ChildPath "Effectifs_Effectif-present.csv"
$effectifNonPresentsFilePath = Join-Path -Path $payrollPath -ChildPath "Effectifs_Non-present.csv"
$payrollFilePath = Join-Path -Path $payrollPath -ChildPath "Complete\Paie.csv"

$effectifALD = Import-Csv -Path $effectifALDFilePath -Delimiter "," -Encoding DEFAULT
$effectifPresents = Import-Csv -Path $effectifPresentsFilePath -Delimiter "," -Encoding DEFAULT
$effectifNonPresents = Import-Csv -Path $effectifNonPresentsFilePath -Delimiter "," -Encoding DEFAULT

$effectifALDFileName = [System.IO.Path]::GetFileNameWithoutExtension($effectifALDFilePath)
$effectifPresentsFileName = [System.IO.Path]::GetFileNameWithoutExtension($effectifPresentsFilePath)
$effectifNonPresentsFileName = [System.IO.Path]::GetFileNameWithoutExtension($effectifNonPresentsFilePath)
$payrollResults = @()

if ($effectifALD) {
    foreach ($item in $effectifALD) {
        $values = [ordered]@{ FileName = $effectifALDFileName }

        foreach ($property in $item.PSObject.Properties) {
            $values[$property.Name] = $property.Value
        }

        $values['Date Début Suspension'] = ''
        $values['Date Fin Suspension'] = ''
        $payrollResults += New-Object -TypeName psobject -Property $values
    }
}

if ($effectifPresents) {
    foreach ($item in $effectifPresents) {
        $values = [ordered]@{ FileName = $effectifPresentsFileName }

        foreach ($property in $item.PSObject.Properties) {
            $values[$property.Name] = $property.Value
        }

        $payrollResults += New-Object -TypeName psobject -Property $values
    }
}

if ($effectifNonPresents) {
    foreach ($item in $effectifNonPresents) {
        $values = [ordered]@{ FileName = $effectifNonPresentsFileName }

        foreach ($property in $item.PSObject.Properties) {
            $values[$property.Name] = $property.Value
        }

        $values['Date Début ALD'] = ''
        $values['Date Fin ALD'] = ''
        $payrollResults += New-Object -TypeName psobject -Property $values
    }
}

if ($payrollResults.Length -gt 0) {
    $payrollResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $payrollFilePath -Encoding utf8
}
