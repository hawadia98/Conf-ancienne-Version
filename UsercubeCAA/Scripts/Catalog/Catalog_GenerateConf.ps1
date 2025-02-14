<#
.SYNOPSIS
    Générer le catalogue des applications.

.DESCRIPTION
    Générer le catalogue des applications sous format XML.
#>

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

try {
    $urlToken = $apiuri + "/connect/token"
    $body = @{
        grant_type = "client_credentials"
        scope = "usercube_api"
        client_id = $clientId
        client_secret = $clientSecret
    }

    $token = Invoke-RestMethod -Method Post -Uri $urlToken -Body $body -UseDefaultCredentials
}
catch {
    Write-Host "[ERREUR] Erreur lors de l'appel du web service d'init token : $($_.Exception.Message)"
    Exit 1
}

$htabParamWebRequestPost = @{
    Uri = ""
    Method = "GET"
    Headers = @{
        "Authorization" = "Bearer $($token.access_token)"
    }
    ContentType = "application/json"
    ErrorAction = "stop"
}

$apiPath = "/api/Resource/Directory_Application?api-version=1.0"
$path = "/Custom/Resources/Directory_Application/View"
$squery = "join ProvisioningType p select Identifier, DisplayName, p.Identifier"

$url = $apiuri + $apiPath + '&path=' + $path + '&squery=' + $squery
$htabParamWebRequestPost.Uri = $url

try {
    $applications = Invoke-RestMethod @htabParamWebRequestPost
    Write-Host "[OK] Lecture des applications."
    $taskResourceTypes = ''

    foreach ($application in $applications.Result) {
        $identifier = [System.Security.SecurityElement]::Escape($application.Identifier)
        $displayName = [System.Security.SecurityElement]::Escape($application.DisplayName)
        $type = [System.Security.SecurityElement]::Escape($application.ProvisioningType.Identifier)

        if ($type -eq "Tâche") {
            $templatePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Template\#Application_Identifier# Manual Role Model Directory.off"
        }
        elseif ($type -eq "Mail") {
            $templatePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Template\#Application_Identifier# Mail Role Model Directory.off"
        }
        elseif ($type -eq "AD") {
            $templatePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Template\#Application_Identifier# AD Role Model Directory.off"
        }
        elseif ($type -eq "Fichier") {
            $templatePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Template\#Application_Identifier# File Role Model Directory.off"
        }
        else {
            continue
        }

        $outputFile = [System.IO.Path]::GetFileNameWithoutExtension($templatePath)
        $outputFile = $outputFile.replace("#Application_Identifier#", $identifier)

        if ($type -eq "Mail"){
            $outputPath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Mail\Generated\$outputFile.xml"
        }else{
            $outputPath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Catalog\Generated\$outputFile.xml"
        }
        
        (Get-Content $templatePath).replace("#Application_Identifier#", $identifier).replace("#Application_Name#", $displayName) | Out-File $outputPath -Encoding utf8

		if ($type -ne "Tâche") {
			continue
		}

        $taskResourceTypes += '     <TaskResourceType ResourceType="' + $identifier + '" />' + "`r`n"
        Write-Host "[OK] Génération de l'application : $displayName"
    }

    $jobTemplatePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Template\Application Provisioning Jobs.off"
    $jobFilePath = Join-Path -Path $applicationPath -ChildPath "Conf\Application Catalog\Generated\Application Provisioning Jobs.xml"
    Set-Content -Encoding UTF8 $jobFilePath (Get-Content $jobTemplatePath).replace("<!-- #Task_ResourceType# -->", $taskResourceTypes)
    Write-Host "[OK] Mettre à jour le job des applications."
}
catch {
    Write-Host "[ERREUR] Erreur lors de l'appel du web service lecture des applications : $($_.Exception.Message)"
    Exit 1
}
