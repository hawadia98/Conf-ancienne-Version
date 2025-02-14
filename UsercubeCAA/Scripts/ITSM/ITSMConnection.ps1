<# 
.SYNOPSIS 
 Service Now Usercube connector.
 
.DESCRIPTION 
 This PowerShell script is the Service Now (SNOW) custom connector for Usercube.
 
.NOTES 
┌─────────────────────────────────────────────────────────────────────────────────────────────┐ 
│ ORIGIN STORY                                                                                │ 
├─────────────────────────────────────────────────────────────────────────────────────────────┤ 
│   DATE        : 2025.01.14                                                                  │
│   AUTHOR      : __MECHLAOUI Sabri__                                                         │
│   DESCRIPTION : Service Now (ITSM) custom connector.                                               │
└─────────────────────────────────────────────────────────────────────────────────────────────┘ 

.INPUTS
Provisioning Order.
Path for CSV Sync file.

.OUTPUTS
SNOW API Response.
CSV Sync file for Usercube.

.PARAMETER Param01 
__DESC_PARAM01__ 
 
.EXAMPLE 
    .\ServiceNow.ps1 -?
    .\ServiceNow.ps1 -ordersPath .\ProvisioningOrders_0.json -resultsFilePath ".\Sources\SNOW_Fulfill_Sync.csv"

#>


[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]
    $ordersPath,

    [Parameter(Mandatory=$false)]
    [String]
    $resultsFilePath = "D:\\UsercubeCAA\\Sources\\ITSM\\SNOW_Fulfill_Sync.csv"
)


. (Join-Path -Path $PSScriptRoot -ChildPath ".\Config-ServiceNow.ps1")


function Invoke-SNowRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [System.Object]
        $body,

        [Parameter(Mandatory=$false)]
        [String]
        $token,

        [Parameter(Mandatory=$false)]
        [String]
        $endpoint
    )

    $url = "https://rct-servicenow.pacifica.obs.partenaires.group.gca"
	$proxyUrl = "http://10.108.172.132:8080"
    
	if ($endpoint -ne $null) {
        $url += $endpoint
    }

    if ($token) {
        $headers = @{
            Authorization = "Bearer $token"
        }
        $contentType = "application/json"
    } else {
        $headers = @{}
        $contentType = "application/x-www-form-urlencoded"
    }

    try {
        Write-Debug $url
        return Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -ContentType $contentType -Proxy $proxyUrl -ProxyUseDefaultCredentials
    }
    catch {
        Write-Error -Message "An error while making the Rest API request: $($_.Exception.Message)" -Category ConnectionError
        return $null
    }
}


function Get-AccessToken {
    Write-Debug $config.grant_type
    $body = @{
        grant_type      = $config.grant_type
        client_id       = $config.client_id
        client_secret   = $config.client_secret
        username        = $config.username
        password        = $config.password
    }
    Invoke-SNowRequest -Body $body -endpoint "/oauth_token.do"
}

function Read-ProvisioningOrder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]
        $path
    )

    return Get-Content -Raw $path | ConvertFrom-Json
}


function Fulfill-SNOW-Added {
    param (
        [Parameter(Mandatory=$true)]
        [System.Object]
        $Order,

        [Parameter(Mandatory=$true)]
        [System.Object]
        $token
    )

    $body = @{
        u_arrival_type = "extern" # $($Order.ProvisioningOrdersList.Changes.u_arrival_type)
        u_email = "amandine.francin@ca-pacifica.fr" # $($Order.ProvisioningOrdersList.Changes.u_arrival_type)
        u_phone_number = "0123456789" # $($Order.ProvisioningOrdersList.Changes.u_phone_number)
        u_desk_location = "C201" # $($Order.ProvisioningOrdersList.Changes.u_phone_number.u_site)
        u_type_de_pc = "portable"
        u_master = "poste_standard"
        u_telephone_fixe = "present" # $($Order.ProvisioningOrdersList.Changes.u_telephony)
        u_commentaires = "Test commentaire"
    }

    Write-Debug ($body | ConvertTo-Json -Compress)

    $response = Invoke-SNowRequest -token $token -body ($body | ConvertTo-Json -Compress) -endpoint "/api/now/import/u_imp_new_arrival"
    Write-Debug "Response : $(ConvertTo-Json -InputObject $response)"

    if ($response.result.status -eq "error") {
        Write-Error -Message $response.result.error_message -Category InvalidArgument
        exit 1
    }
}


function Fulfill-SNOW_CSV {
    param (
        [Parameter(Mandatory=$true)]
        [System.Object]
        $Order,

        [Parameter(Mandatory=$true)]
        [String]
        $resultsFilePath
    )

    switch ($Order.ProvisioningOrdersList.ChangeType) {
        "Added" {
            $command = "Insert"
        }
        "Modified" {
            $command = "Update"
        }
        "Deleted" {
            $command = "Delete"
        }
        Default {
            throw "Order ChangeType: $($Order.ProvisioningOrdersList.ChangeType) not recognized in AssignedResourceTypeId: $($Order.ProvisioningOrdersList.AssignedResourceTypeId)"
        }
    }

    $csv_content = @(
        [PSCustomObject]@{
            Command = $command
            u_arrival_type = "extern" # $($Order.ProvisioningOrdersList.Changes.u_arrival_type)
            u_email = "amandine.francin@ca-pacifica.fr" # $($Order.ProvisioningOrdersList.Changes.u_arrival_type)
            u_phone_number = "0123456789" # $($Order.ProvisioningOrdersList.Changes.u_phone_number)
            u_desk_location = "C201" # $($Order.ProvisioningOrdersList.Changes.u_phone_number.u_site)
            u_type_de_pc = "Portable"
            u_master = "Poste standard"
            u_telephone_fixe = "Present" # $($Order.ProvisioningOrdersList.Changes.u_telephony)
            u_commentaires = "Test commentaire"
        }
    )

    try {
        if (Test-Path -Path $resultsFilePath) {
            $csv_content | Export-Csv -Path $resultsFilePath -NoTypeInformation -Append
        } else {
            $csv_content | Export-Csv -Path $resultsFilePath -NoTypeInformation
        } Write-Debug "CSV exported successfully to $resultsFilePath"
    } catch {
        Write-Error -Message "Failed to export CSV: $($_.Exception.Message)" -Category InvalidOperation
    }
}


function Fulfill-SNOW {
    param (
        [Parameter(Mandatory=$true)]
        [System.Object]
        $Order
    )

    $token = (Get-AccessToken).access_token

    if ($null -ne $token) {
        Write-Host $token -ForegroundColor Cyan
        switch ($Order.ProvisioningOrdersList.ChangeType) {
            "Added" { 
                Write-Debug "ChangeType status: Added"
                & ('Fulfill-SNOW-' + $Order.ProvisioningOrdersList.ChangeType) -Order $Order -token $token
                Fulfill-SNOW_CSV -Order (Read-ProvisioningOrder -Path $ordersPath) -resultsFilePath $resultsFilePath
            }
            "Modified" {
                Write-Debug "ChangeType status: Modified"
            }
            "Deleted" {
                Write-Debug "ChangeType status: Deleted"
            }
            Default {
                throw "Order ChangeType: $($Order.ProvisioningOrdersList.ChangeType) not recognized in AssignedResourceTypeId: $($Order.ProvisioningOrdersList.AssignedResourceTypeId)"
            }
        }
    }
}

Fulfill-SNOW -Order (Read-ProvisioningOrder -Path $ordersPath)
