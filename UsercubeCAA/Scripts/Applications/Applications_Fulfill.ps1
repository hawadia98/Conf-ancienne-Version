<#
.SYNOPSIS
Fulfill CSV Applications Accounts and Applications Permissions

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
. "$PSScriptRoot/Variable.ps1"

. (Join-Path -Path $PSScriptRoot -ChildPath "Variable.ps1")
. (Join-Path -Path $runtimePath -ChildPath "Usercube-Visit-Orders.ps1")

# Fulfill CSV : gÃ©nere les fichiers CSV permattant la synchro direct (statut : Verified)
function Fulfill_CSV {
    param ([parameter(Mandatory = $true)] $Order)

    $changeType = $Order.ChangeType
    $identifier = $Order.Changes.Identifier
    if (!$identifier){
        $identifier = $Order.Resource.Identifier
        if (!$identifier){
            throw "Identifier is primary key and must not be null."
        }
    }

    # GET THE COMMAND ASSIGNED
    if ($changeType -eq 'Added') {
        $command = "Insert"
    } elseif ($changeType -eq 'Deleted') {
        $command = "Delete"
    } elseif ($changeType -eq 'Modified') {
        $command = "Update"
    }

    $values = [ordered]@{ Command = "$command" }
    $BaseValues = @('Company','ContractEndDate','ContractStartDate','Email','FirstName','Identifier','LastName','Site')

    # Add properties from the resource to the values.
    foreach ($property in $Order.Resource.PSObject.Properties) {
        if (($property.Name.Contains("_add")) -or ($property.Name.Contains("_remove")) -or ($property.Name -eq 'Id') -or ($property.Name -eq 'InternalDisplayName')) {
            continue
        }
        
        $values[$property.Name] = $property.Value
    }

    # Add properties from the changes to the values.
    foreach ($property in $Order.Changes.PSObject.Properties) {
        if (($property.Name.Contains("_add")) -or ($property.Name.Contains("_remove"))) {
            continue
        }
        $values[$property.Name] = $property.Value
    } 

    foreach ($colonne in $BaseValues) {
    # VÃ©rifier si la clÃ© n'existe pas dans $values
        if (-not $values.Contains($colonne)) {
            # Ajouter la clÃ© avec une valeur vide
            $values[$colonne] = ""
        }
    }

    $script:powershellResults += New-Object -TypeName psobject -Property $values

    $PermissionsAdd = $Order.Changes.Permissions_add
    $PermissionsRemove = $Order.Changes.Permissions_remove

    foreach($Permission in $PermissionsAdd){
        $commandPermission = "Merge"
        $PermissionId = $Permission.Identifier 
        $script:powershellPermissionsResults += New-Object -TypeName psobject -Property @{Command = "$commandPermission"; Identifier = "$identifier"; Permissions = "$PermissionId" }
    }

    foreach($Permission in $PermissionsRemove){
        $commandPermission = "Delete"
        $PermissionId = $Permission.IamId 
        $script:powershellPermissionsResults += New-Object -TypeName psobject -Property @{Command = "$commandPermission"; Identifier = "$identifier"; Permissions = "$PermissionId" }
    }    
}

# Fulfill API : permet de rÃ©cuperer les informations nÃ©cessaires pour la comparaison lors de l'envoi de mail
function Fulfill_API {
    param ([parameter(Mandatory = $true)] $Order)
    
    $apiPath = '/api/Resource/Application_Account?api-version=1.0'
    $path = '/Custom/Resources/Application_Account/View&QueryRootEntityType=Application_Account'
    $url = 'http://localhost:5000'
    $continuationToken = ''
    $pageSize = 10000

    $changeType = $Order.ChangeType
    $identifier = $Order.Changes.Identifier
    if (!$identifier){
        $identifier = $Order.Resource.Identifier
        if (!$identifier){
            throw "Identifier is primary key and must not be null."
        }
    }
    
    if($changeType -eq 'Added'){

        $BaseOrder = $Order.Changes
    }else{

        $BaseOrder = $Order.Owner
    }

    $squery = 'join Permissions p select FirstName, LastName, Email, Identifier, ContractStartDate, ContractEndDate, Company, Site, p.Identifier, p.ApplicationName where (Identifier = "' + $BaseOrder.Identifier +'") order by Id asc'
    Write-Host $squery
    $apiUrl = $url + $apiPath + '&path=' + $path + '&squery=' + $squery + '&PageSize=' + $pageSize + '&ContinuationToken='

    $tokenUrl = 'http://localhost:5000/connect/token'
    $bodyToken = "client_id=Job@localhost&client_secret=secret&scope=usercube_api&grant_type=client_credentials"

    try {

        $token = (Invoke-RestMethod -Uri $tokenUrl -Method POST -Body $bodyToken).access_token
    
    }
    
    catch {
        
        $errorMessage = $_.Exception.Message
    
        Throw $errorMessage
    
    }

    $retries = 2

    $firstCall = $true
    $ApplicationTab =@()
    
    do

    {

        while (![string]::IsNullOrEmpty($continuationToken) -or $firstCall) {

            try {

                if ($firstCall) {

                    $continuationToken = ''

                    $firstCall = $false

                }

                $results = Invoke-RestMethod -Uri ($apiUrl + $continuationToken) -Method 'GET' -headers @{Authorization = 'Bearer ' + $token}
                
                $retries = 1

                $continuationToken = $results.ContinuationToken


                foreach ($entry in $results.Result) {

                    foreach ($Permissions in $entry.Permissions){
                        $ApplicationTab += $Permissions.ApplicationName
                    }    
                    Write-Host $ApplicationTab
                }

            }

            catch {

                Write-Host -ForegroundColor Red "Error Usercube API"

                Write-Host $_

                $retries--

            }
        }
    }

    While ($continue -and $retries -ge 0)
    Write-Host $ApplicationTab
    return $ApplicationTab
}

# Fulfill Email : Permet l'envoi du mail avec la bonne template Ã  l'address mail partner de l'application
function Fulfill_Email_Added {
    param (
        [parameter(Mandatory = $true)] $Order
        )
    
    $changeType = $Order.ChangeType
    $identifier = $Order.Changes.Identifier
    if (!$identifier){
        $identifier = $Order.Resource.Identifier
        if (!$identifier){
            throw "Identifier is primary key and must not be null."
        }
    }

    $PermissionsAddEmail = $Order.Changes.Permissions_add
    $PermissionsTabAdd=""
    
    foreach ($Permission in $PermissionsAddEmail){
         $PermissionName = $Permission.DisplayName
         $PermissionsTabAdd += "$PermissionName , "
     }

    if($changeType -eq 'Added')
     {
        $PermissionsTabAdd = $PermissionsTabAdd.Substring(0,$PermissionsTabAdd.Length - 3)
        Write-Host $Order.Changes.Permissions_add.ApplicationName
         # Parametres de l'e-mail
         $smtpServer = "localhost"  # Remplacez par l'adresse de votre serveur SMTP
         $port = 25 
         $from = "UsercubeCAA@CAAS.fr"
         $to = $Order.Changes.Permissions_add.AddressMailPartner
         $subject = "Creation du compte & Ajout de droit"
         $body = "Creation de compte pour l'application : "+ $Order.Changes.Permissions_add.ApplicationName + "`nAjout de(s) droit(s) suivant : "+ $PermissionsTabAdd + "`nId : " + $Order.Changes.Identifier +"`nCollaborateur : " + $Order.Changes.FirstName +" "+ $Order.Changes.LastName

         # Creation de l'objet MailMessage
         $mailMessage = New-Object System.Net.Mail.MailMessage
         $mailMessage.From = $from
         $mailMessage.To.Add($to)
         $mailMessage.Subject = $subject
         $mailMessage.Body = $body

         # Configuration du client SMTP
         $smtpClient = New-Object System.Net.Mail.SmtpClient
		 $pickupDirectory = "D:\UsercubeCAA\Temp\Mails"
         $smtpClient.EnableSsl = $false  # Activer SSL (si requis par le serveur SMTP)
		 $smtpClient.DeliveryMethod = [System.Net.Mail.SmtpDeliveryMethod]::SpecifiedPickupDirectory
         $smtpClient.PickupDirectoryLocation = $pickupDirectory

         # Envoi de l'e-mail
         try {
             $smtpClient.Send($mailMessage)
             Write-Host "E-mail envoye avec succes."
         } catch {
             Write-Host "Erreur lors de l'envoi de l'e-mail : $_"
         }
     }

}

function Fulfill_Email_Modified{
    param (
        [parameter(Mandatory = $true)] $Order
        )
    
    $changeType = $Order.ChangeType
    $identifier = $Order.Changes.Identifier
    if (!$identifier){
        $identifier = $Order.Resource.Identifier
        if (!$identifier){
            throw "Identifier is primary key and must not be null."
        }
    } 

    $PermissionsModifiedEmail = $Order.Changes.Permissions_add
    $PermissionsDeletedEmail = $Order.Changes.Permissions_remove

    $PermissionsTabModified=""
    $PermissionsTabDeleted=""

    foreach ($Permission in $PermissionsModifiedEmail){
         $PermissionName = $Permission.DisplayName
         $PermissionsTabModified += "$PermissionName , "
    }

    foreach ($Permission in $PermissionsDeletedEmail){
        $PermissionName = $Permission.DisplayName
        $PermissionsTabDeleted += "$PermissionName , "
   }

    if($changeType -eq 'Modified' -and $PermissionsTabModified -ne $null -and $PermissionsTabModified -ne '')
    { 
        write-host "toto"
        $PermissionsTabModified = $PermissionsTabModified.Substring(0,$PermissionsTabModified.Length - 3)
        # ParamÃ¨tres de l'e-mail
        $smtpServer = "localhost"  # Remplacez par l'adresse de votre serveur SMTP
        $port = 25 
        $from = "UsercubeCAA@CAAS.fr"
        $to = $Order.Changes.Permissions_add.AddressMailPartner
        Write-Host $to
        $subject = "Ajout de droit"
        $body = "Ajout de droit(s) pour l'application : "+ $Order.Changes.Permissions_add.ApplicationName + "`nAjout de(s) droit(s) suivant : "+ $PermissionsTabModified + "`nId : " + $Order.Resource.Identifier +"`nCollaborateur : " + $Order.Resource.FirstName +" "+ $Order.Resource.LastName

        # CrÃ©ation de l'objet MailMessage
        $mailMessage = New-Object System.Net.Mail.MailMessage
        $mailMessage.From = $from
        $mailMessage.To.Add($to)
        $mailMessage.Subject = $subject
        $mailMessage.Body = $body

        # Configuration du client SMTP
        $smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $port)
        $smtpClient.EnableSsl = $false  # Activer SSL (si requis par le serveur SMTP)
        #$smtpClient.Credentials = New-Object System.Net.NetworkCredential($username, $password)

        # Envoi de l'e-mail
        try {
            $smtpClient.Send($mailMessage)
            Write-Host "E-mail envoyÃ© avec succÃ¨s."
        } catch {
            Write-Host "Erreur lors de l'envoi de l'e-mail : $_"
        }
    }
    if($changeType -eq 'Modified'-and $PermissionsTabDeleted -ne $null -and $PermissionsTabDeleted -ne '')
    {
        $PermissionsTabDeleted = $PermissionsTabDeleted.Substring(0,$PermissionsTabDeleted.Length - 3)
        write-host "tata"
        # ParamÃ¨tres de l'e-mail
        $smtpServer = "localhost"  # Remplacez par l'adresse de votre serveur SMTP
        $port = 25 
        $from = "UsercubeCAA@CAAS.fr"
        $to = $Order.Changes.Permissions_remove.AddressMailPartner
        Write-Host $to
        $subject = "retrait de droit"
        $body = "Retrait de droit pour l'application : "+ $Order.Changes.Permissions_remove.ApplicationName + "`nRetrait de(s) droit(s) suivant : "+ $PermissionsTabDeleted + "`nId : " + $Order.Resource.Identifier +"`nCollaborateur : " + $Order.Resource.FirstName +" "+ $Order.Resource.LastName

        # CrÃ©ation de l'objet MailMessage
        $mailMessage = New-Object System.Net.Mail.MailMessage
        $mailMessage.From = $from
        $mailMessage.To.Add($to)
        $mailMessage.Subject = $subject
        $mailMessage.Body = $body

        # Configuration du client SMTP
        $smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $port)
        $smtpClient.EnableSsl = $false  # Activer SSL (si requis par le serveur SMTP)
        #$smtpClient.Credentials = New-Object System.Net.NetworkCredential($username, $password)

        # Envoi de l'e-mail
        try {
            $smtpClient.Send($mailMessage)
            Write-Host "E-mail envoyÃ© avec succÃ¨s."
        } catch {
            Write-Host "Erreur lors de l'envoi de l'e-mail : $_"
        }
    }
}

function Fulfill_Email_Deleted{

}
# Fulfill Applications : execute les 3 fonctions ci-dessus avec l'Usercube Visit Order
function Fulfill_Applications {
    param ([parameter(Mandatory = $true)] $Order)

    $changeType = $Order.ChangeType
    $assignedResourceTypeId = $Order.AssignedResourceTypeId

    if ($changeType -ne 'Added' -and $changeType -ne 'Deleted' -and $changeType -ne 'Modified') {
        throw "Order ChangeType: $changeType not recognized in AssignedResourceTypeId: '$assignedResourceTypeId'"
    }

    & ('Fulfill_CSV') -Order $Order
    #$ReturnAPI = Fulfill_API -Order $Order
    & ('Fulfill_Email_Added') -Order $Order
    #& ('Fulfill_Email_Modified') -Order $Order # -returnAPI $ReturnAPI
    #& ('Fulfill_Email_Deleted') -Order $Order

}

$powershellResults = @()
$powershellPermissionsResults = @()

Usercube-Visit-Orders $resultsFilePath $ordersPath Fulfill_Applications

$powershellResultFilePath = (Join-Path -Path $sourcesPath -ChildPath "Incremental\Applications_Accounts.csv")
 $powershellPermissionsResultFilePath = (Join-Path -Path $sourcesPath -ChildPath "Incremental\Applications_Permissions.csv")

if ($powershellResults.Length -gt 0){
     $powershellResults | ConvertTo-Csv -Delimiter "," -NoTypeInformation | Out-File $powershellResultFilePath -Encoding utf8
}

if ($powershellPermissionsResults.Length -gt 0){
    $powershellPermissionsResults | Select-Object Command, Permissions, Identifier | ConvertTo-Csv -Delimiter "," -NoTypeInformation | Out-File $powershellPermissionsResultFilePath -Encoding utf8
}