
param (
    [Parameter(Mandatory = $true)][string]$demandeur,
    [Parameter(Mandatory = $true)][string]$demande_pour,
    [Parameter(Mandatory = $true)][string]$demande_pour_le,
    [Parameter(Mandatory = $true)][string]$article_id,
    [Parameter(Mandatory = $true)][string]$external_id,
    [Parameter(Mandatory = $true)][string]$follow_up_group,
    [string]$short_description,
    [string]$due_date,
    [string]$estimated_delivery,
    [string]$contact,
    [string]$commentaires

)

# Constantes
$EnvironmentPath = Split-Path $PSScriptRoot -parent
. "$EnvironmentPath\Environnement.ps1"
. (Join-Path -Path $PSScriptRoot -ChildPath ".\Config-Metis.ps1")

#Post add
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11

#Get token
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/x-www-form-urlencoded")

$body = "client_id=$metis_client_id&client_secret=$metis_client_secret&username=$metis_username&password=$metis_password&grant_type=password"


$response = Invoke-RestMethod $metis_token_url -Method 'POST' -Headers $headers -Proxy $proxy -SessionVariable session -Body $body
$response | ConvertTo-Json
$Authorization = "Bearer " + $response.access_token

Clear-Variable headers
Clear-Variable response


#Provisionning
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $Authorization)
$headers.Add("Content-Type", "application/json")

$u_variables = "cagip_arrivee_demandeur[=]"+$demandeur+"[#]"
$u_variables = $u_variables+"requested_for[=]"+$demande_pour+"[#]"
$u_variables = $u_variables+"cagip_arrivee_demand_pour_le[=]"+$demande_pour_le+"[#]"
$u_variables = $u_variables+"watch_list[=]"+$contact+"[#]"
$u_variables = $u_variables+"cagip_arrivee_commentaire[=]$commentaires[#]"


#`n`"u_follow_up_group`": `"$followup_group`",

$body_tmp = "{
`n`"u_article_id`": `"$article_id`",
`n`"u_external_id`": `"$external_id`",
`n`"u_short_description`": `"$short_description`",
`n`"u_due_date`": `"$due_date`",
`n`"u_estimated_delivery`": `"$estimated_delivery`",
`n`"u_follow_up_group`": `"$follow_up_group`",
`n`"u_variables`": `"$u_variables`"
`n}"

Write-Output $body_tmp

$body = [System.Text.Encoding]::UTF8.GetBytes($body_tmp)

$response = Invoke-RestMethod $metis_request_url -Method 'POST' -Proxy $proxy -Headers $headers -WebSession $session -Body $body
$response | ConvertTo-Json

if($response.result.status -eq "error"){
    throw @("`nResponse : " + $response.result.error_message + "`n", [string]$body_tmp)
}