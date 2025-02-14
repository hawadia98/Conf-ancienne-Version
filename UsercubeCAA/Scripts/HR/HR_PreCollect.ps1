<#
.SYNOPSIS
    Traitement RH.

.DESCRIPTION
    Traitement RH pour préparer les fichiers à la synchronisation incremental.
#>

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

function GetTruncateValue([string] $svalue) {
	if ([string]::IsNullOrEmpty($svalue)) {
		return $svalue
	}
	
	return $svalue.subString(0, [System.Math]::Min(100, $svalue.Length))
}

$hrPath = Join-Path -Path $applicationPath -ChildPath "Sources\RH"
$payrollPath = Join-Path -Path $applicationPath -ChildPath "Sources\Paie"

$internalEntriesFilePath = Join-Path -Path $hrPath -ChildPath "RH_entrees_cdi_cdd.csv"
$workStudyEntriesFilePath = Join-Path -Path $hrPath -ChildPath "RH_entrees_alternants_apprentis.csv"
$endUserEntriesFilePath = Join-Path -Path $hrPath -ChildPath "RH_sorties_mobilitees.csv"
$loadUIGFilePath = Join-Path -Path $payrollPath -ChildPath "Load_IUG.csv"

$hrFilePath = Join-Path -Path $hrPath -ChildPath "Incremental\RH_entrees.csv"
$hrEndFilePath = Join-Path -Path $hrPath -ChildPath "Incremental\RH_sorties_mobilitees.csv"
$loadUIGIncrementalFilePath = Join-Path -Path $hrPath -ChildPath "Incremental\Load_IUG.csv"

$internalEntries = Import-Csv -Path $internalEntriesFilePath -Delimiter "," -Encoding UTF8
$workStudyEntries = Import-Csv -Path $workStudyEntriesFilePath -Delimiter "," -Encoding UTF8
$endUserEntries = Import-Csv -Path $endUserEntriesFilePath -Delimiter "," -Encoding UTF8
$loadUIGEntries = Import-Csv -Path $loadUIGFilePath -Delimiter ";" -Encoding DEFAULT

$internalEntriesFileName = [System.IO.Path]::GetFileNameWithoutExtension($internalEntriesFilePath)
$workStudyEntriesFileName = [System.IO.Path]::GetFileNameWithoutExtension($workStudyEntriesFilePath)
$endUserEntriesFileName = [System.IO.Path]::GetFileNameWithoutExtension($endUserEntriesFilePath)
$hrResults = @()
$hrEndResults = @()
$loadUIGResults = @()

if ($internalEntries) {
    foreach ($item in $internalEntries) {
        $identifier = $item.NOM + "_" + $item.PRENOM
		$tidentifier = GetTruncateValue $identifier
        $values = [ordered]@{ Command = "Merge"; FileName = $internalEntriesFileName; UC_Identifier = $tidentifier }

        foreach ($property in $item.PSObject.Properties) {
			$tvalue = GetTruncateValue $property.Value
            $values[$property.Name] = $tvalue
        }

        $hrResults += New-Object -TypeName psobject -Property $values
    }
}

if ($workStudyEntries) {
    foreach ($item in $workStudyEntries) {
        $identifier = $item.NOM + "_" + $item.PRENOM
		$tidentifier = GetTruncateValue $identifier
        $values = [ordered]@{ Command = "Merge"; FileName = $workStudyEntriesFileName; UC_Identifier = $tidentifier }

        foreach ($property in $item.PSObject.Properties) {
            $tvalue = GetTruncateValue $property.Value
            $values[$property.Name] = $tvalue
        }

        $hrResults += New-Object -TypeName psobject -Property $values
    }
}

if ($endUserEntries) {
    foreach ($item in $endUserEntries) {
        $values = [ordered]@{ Command = "Insert"; FileName = $endUserEntriesFileName }

        foreach ($property in $item.PSObject.Properties) {
            $tvalue = GetTruncateValue $property.Value
            $values[$property.Name] = $tvalue
        }

        $hrEndResults += New-Object -TypeName psobject -Property $values
    }
}

if ($loadUIGEntries) {
    foreach ($item in $loadUIGEntries) {
        $values = [ordered]@{ Command = "Insert"; }

        foreach ($property in $item.PSObject.Properties) {
            $tvalue = GetTruncateValue $property.Value
            $values[$property.Name] = $tvalue
        }

        $loadUIGResults += New-Object -TypeName psobject -Property $values
    }
}

if ($hrResults.Length -gt 0) {
    $hrResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $hrFilePath -Encoding utf8
}
else {
    $rhHeader = Get-Content $hrFilePath | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
    Set-Content $hrFilePath -Value $rhHeader -encoding UTF8
}

if ($hrEndResults.Length -gt 0) {
    $hrEndResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $hrEndFilePath -Encoding utf8
}
else {
    $rhEndHeader = Get-Content $hrEndFilePath | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
    Set-Content $hrEndFilePath -Value $rhEndHeader -encoding UTF8
}

if ($loadUIGResults.Length -gt 0) {
    $loadUIGResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $loadUIGIncrementalFilePath -Encoding utf8
}
else {
    $loadIUGHeader = Get-Content $loadUIGIncrementalFilePath | Where-Object { $_ -notmatch '^#type' } | Select-Object -First 1
    Set-Content $loadUIGIncrementalFilePath -Value $loadIUGHeader -encoding UTF8
}
