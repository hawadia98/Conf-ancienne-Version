<#
.SYNOPSIS
Fulfill CSV Applications Accounts and Applications Profiles

.DESCRIPTION
None.

.INPUTS
None.

.OUTPUTS
None.

.NOTES
Version: 1.0
#>
[CmdletBinding()]

param(
  [Parameter(Mandatory)]
  [string]$resultsFilePath,

  [Parameter(Mandatory)]
  [string]$ordersPath,

  [Parameter()]
  [string]$template
)

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"
. (Join-Path -Path $runtimePath -ChildPath "Usercube-Visit-Orders.ps1")

function Get-Parameter {
    param (
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [Object]$Order,

        [Parameter()]
        [Object]$Options = [PSCustomObject]@{},

        [Parameter()]
        [Object]$Default
    )
    
    $changeType = $Order.ChangeType
    $assignedResourceTypeId = $Order.AssignedResourceTypeId

    try {
        if ($Order.Changes.PSObject.Properties.Name -contains $Name) {
            $Order.Changes.PSObject.Properties[$Name].Value
        } elseif ($Options.PSObject.Properties.Name -contains $Name) {
            $value = $Options.PSObject.Properties[$Name].Value
            
            if ($value -is [PSCustomObject]) {
                if ($value.PSObject.Properties.Name -contains $changeType) {
                    $value.PSObject.Properties[$changeType].Value
                } else {
                    throw "Required parameter '$Name' is missing in AssignedResourceTypeId: '$assignedResourceTypeId'"
                }
            } else {
                $value
            }
        } else {
            throw "Required parameter '$Name' is missing in AssignedResourceTypeId: '$assignedResourceTypeId'"
        }
    } catch {
        if ($PSBoundParameters.ContainsKey('Default')) {
            $Default
        } else {
            throw
        }
    }
}

function ProcessTemplate {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [String]$Template,

        [Parameter()]
        [hashtable]$Environment = @{}
    )
    
    foreach ($variable in $Environment.GetEnumerator()) {
        Set-Variable -Name $variable.Name -Value $variable.Value
    }

    $ExecutionContext.InvokeCommand.ExpandString($Template)
}

function FulfillEmail {
    param ([parameter(Mandatory = $true)] $order)

    $changeType = $order.ChangeType
    $assignedResourceTypeId = $order.AssignedResourceTypeId
    $dataChanges = $order.Changes
    $dataResource = $order.Resource

    $identifier = $dataChanges.Identifier
    if (!$identifier){
        $identifier = $dataResource.Identifier
        if (!$identifier){
            throw "Identifier is primary key and must not be null."
        }
    }

    if ($changeType -ne 'Added' -and $changeType -ne 'Deleted' -and $changeType -ne 'Modified') {
        throw "Order ChangeType: $changeType not recognized in AssignedResourceTypeId: '$assignedResourceTypeId'"
    }

    $environment = @{ 'order' = $Order }
    if ($null -ne $dataResource) {
        $dataResource.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'order' ) { $environment[$_.Name] = $_.Value } }
    }
    if ($null -ne $dataChanges) {
        $dataChanges.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'order' ) { $environment[$_.Name] = $_.Value } }
    }

    if ($changeType -eq 'Added') {
        $templatePath = Get-Parameter -Name 'TemplateCreateAccountMessage' -Order $Order -Options $script:options
        
        $profiles = ''
        Foreach($profile in $dataChanges.Profiles_add){
            $profilesInt = $profile.Identifier  
            $profiles += "$profilesInt | "
        }

        $profiles = $profiles.Substring(0, $profiles.Length - 3)
        $environment.Profiles = $profiles

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectCreateAccountMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }
    elseif ($changeType -eq 'Deleted') {
        $templatePath = Get-Parameter -Name 'TemplateDeleteAccountMessage' -Order $Order -Options $script:options

        $environment = @{ 'order' = $Order }
        $dataResource.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'order' ) { $environment[$_.Name] = $_.Value } }

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectDeleteAccountMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }
    elseif (($changeType -eq 'Modified') -and $dataChanges.PSObject.Properties.name -eq 'Profiles_Add') {
        $templatePath = Get-Parameter -Name 'TemplateAddRightMessage' -Order $Order -Options $script:options

        $profiles = ''
        Foreach($profile in $dataChanges.Profiles_add){
            $profilesInt = $profile.Identifier  
            $profiles += "$profilesInt | "
        }

        $profiles = $profiles.Substring(0, $profiles.Length - 3)
        $environment.Profiles = $profiles

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectAddRightMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }
    elseif (($changeType -eq 'Modified') -and $dataChanges.PSObject.Properties.name -eq 'Profiles_Remove') {
        $templatePath = Get-Parameter -Name 'TemplateDeleteRightMessage' -Order $Order -Options $script:options

        $profiles = ''
        Foreach($profile in $dataChanges.Profiles_remove){
            $profilesInt = $profile.Identifier  
            $profiles += "$profilesInt | "
        }

        $profiles = $profiles.Substring(0, $profiles.Length - 3)
        $environment.Profiles = $profiles

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectDeleteRightMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }
    elseif (($changeType -eq 'Modified') -and ($dataChanges.PSObject.Properties.name -eq 'EndDate')) {
        $templatePath = Get-Parameter -Name 'TemplateProlongationMessage' -Order $Order -Options $script:options

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectProlongationMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }
    elseif (($changeType -eq 'Modified') -and ($dataChanges.PSObject.Properties.name -eq 'IsSuspended')) {
        $isSsupended = $dataChanges.IsSuspended
        if ($isSsupended -eq 'OUI') {
            $templatePath = Get-Parameter -Name 'TemplateSuspendAccountMessage' -Order $Order -Options $script:options

            $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
            $subject = Get-Parameter -Name 'SubjectSuspendAccountMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
        }
        else {
            $templatePath = Get-Parameter -Name 'TemplateReactivateAccountMessage' -Order $Order -Options $script:options

            $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
            $subject = Get-Parameter -Name 'SubjectReactivateAccountMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
        }
    }
    else {
        $templatePath = Get-Parameter -Name 'TemplateModifyAccountMessage' -Order $Order -Options $script:options

        $body = Get-Content -Path $templatePath -Raw -Encoding UTF8 | ProcessTemplate -Environment $environment
        $subject = Get-Parameter -Name 'SubjectModifyAccountMessage' -Order $Order -Options $script:options | ProcessTemplate -Environment $environment
    }

    # Send notification
    $from = Get-Parameter -Name 'From' -Order $Order -Options $script:options
    $to = Get-Parameter -Name 'To' -Order $Order -Options $script:options
    if ($dataChanges.PSObject.Properties.name -eq 'Application') {
        $addressMailPartner = $dataChanges.Application.AddressMailPartner
        if(-not ([string]::IsNullOrEmpty($addressMailPartner))) {
            $to = $addressMailPartner
        }
    }
    elseif ($dataResource.PSObject.Properties.name -eq 'AddressMailPartner') {
        $addressMailPartner = $dataResource.AddressMailPartner
        if(-not ([string]::IsNullOrEmpty($addressMailPartner))) {
            $to = $addressMailPartner
        }
    }

    if ($to -is [string]) {
        $to = $to -split ',' | ForEach-Object { $_.Trim() }
    }

    $message = New-Object System.Net.Mail.MailMessage
    $message.From = New-Object System.Net.Mail.MailAddress $from

    $to | ForEach-Object { $message.To.Add($_) }

    $message.Subject = $subject
    $message.Body = $body
    $message.IsBodyHtml = $true

    $deliveryMethod = [System.Net.Mail.SmtpDeliveryMethod](Get-Parameter -Name 'DeliveryMethod' -Order $Order -Options $script:options -Default 'Network')

    $smtpClient = New-Object System.Net.Mail.SmtpClient
    $smtpClient.DeliveryMethod = $deliveryMethod

    if ($deliveryMethod -eq [System.Net.Mail.SmtpDeliveryMethod]::Network) {
        $smtpServer = Get-Parameter -Name 'SmtpServer' -Order $Order -Options $script:options
        $smtpPort = Get-Parameter -Name 'SmtpPort' -Order $Order -Options $script:options -Default 587
        $enableSsl = Get-Parameter -Name 'EnableSsl' -Order $Order -Options $script:options -Default $false
        $userName = Get-Parameter -Name 'UserName' -Order $Order -Options $script:options -Default $null
        $password = Get-Parameter -Name 'Password' -Order $Order -Options $script:options -Default $null
        $useDefaultCredentials = Get-Parameter -Name 'UseDefaultCredentials' -Order $Order -Options $script:options -Default $false

        $smtpClient.Host = $smtpServer
        $smtpClient.Port = $smtpPort
        $smtpClient.EnableSsl = $enableSsl
        $smtpClient.UseDefaultCredentials = $useDefaultCredentials

        if (-not $useDefaultCredentials -and $null -ne $userName) {
            $smtpClient.Credentials = New-Object System.Net.NetworkCredential $userName, $password
        }
    } elseif ($deliveryMethod -eq [System.Net.Mail.SmtpDeliveryMethod]::SpecifiedPickupDirectory) {
        $pickupDirectory = Get-Parameter -Name 'PickupDirectory' -Order $Order -Options $script:options

        $smtpClient.PickupDirectoryLocation = $pickupDirectory
    } else {
        throw "Unsupported DeliveryMethod '$deliveryMethod' in AssignedResourceTypeId: '$assignedResourceTypeId'"
    }

    $smtpClient.Send($message)

    # Generate CSV Files
    # GET THE COMMAND ASSIGNED
    if ($changeType -eq 'Added') {
        $command = "Insert"
    } elseif ($changeType -eq 'Deleted') {
        $command = "Delete"
    } elseif ($changeType -eq 'Modified') {
        $command = "Update"
    }

    $values = [ordered]@{ Command = "$command" }
    $BaseValues = @('Identifier','Login','FirstName','LastName','Email','ContractStartDate','ContractEndDate','Site','Company','IsSuspended','StartDate','EndDate')

    # Add properties from the resource to the values.
    foreach ($property in $dataResource.PSObject.Properties) {
        if (($property.Name.Contains("_add")) -or ($property.Name.Contains("_remove")) -or ($property.Name -eq 'Id') -or ($property.Name -eq 'InternalDisplayName')) {
            continue
        }

        if ($property.Name -eq 'Application') {
            $values[$property.Name] = $dataResource.Application.Identifier
            continue
        }

        $values[$property.Name] = $property.Value
    }

    # Add properties from the changes to the values.
    foreach ($property in $dataChanges.PSObject.Properties) {
        if (($property.Name.Contains("_add")) -or ($property.Name.Contains("_remove"))) {
            continue
        }

        if ($property.Name -eq 'Application') {
            $values[$property.Name] = $dataChanges.Application.Identifier
            continue
        }

        $values[$property.Name] = $property.Value
    } 

    foreach ($colonne in $BaseValues) {
    # Vérifier si la clé n'existe pas dans $values
        if (-not $values.Contains($colonne)) {
            # Ajouter la clé avec une valeur vide
            $values[$colonne] = ""
        }
    }

    $script:powershellResults += New-Object -TypeName psobject -Property $values

    $addedProfiles = $dataChanges.Profiles_add
    $removedProfiles = $dataChanges.Profiles_remove

    foreach($profile in $addedProfiles){
        $commandProfile = "Merge"
        $profileId = $profile.Identifier 
        $script:powershellProfilesResults += New-Object -TypeName psobject -Property @{Command = "$commandProfile"; Identifier = "$identifier"; Profiles = "$profileId" }
    }

    foreach($profile in $removedProfiles){
        $commandProfile = "Delete"
        $profileId = $profile.Identifier 
        $script:powershellProfilesResults += New-Object -TypeName psobject -Property @{Command = "$commandProfile"; Identifier = "$identifier"; Profiles = "$profileId" } 
    }
}

$powershellResults = @()
$powershellProfilesResults = @()

$options = [System.Console]::ReadLine() | ConvertFrom-Json

Usercube-Visit-Orders $resultsFilePath $ordersPath FulfillEmail

$powershellResultFilePath = (Join-Path -Path $applicationPath -ChildPath "Sources\ApplicationMail\Incremental\MailAccounts.csv")
$powershellProfilesResultFilePath = (Join-Path -Path $applicationPath -ChildPath "Sources\ApplicationMail\Incremental\MailAccounts_Profiles.csv")

if ($powershellResults.Length -gt 0){
    $powershellResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $powershellResultFilePath -Encoding utf8
}

if ($powershellProfilesResults.Length -gt 0){
    $powershellProfilesResults | Select-Object Command, Profiles, Identifier | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File $powershellProfilesResultFilePath -Encoding utf8
}
