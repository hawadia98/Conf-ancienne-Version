<#
.SYNOPSIS
Fulfill Exchange mail box.
#>

param(
  [Parameter(Mandatory = $true)][string]$resultsFilePath,
  [Parameter(Mandatory = $true)][string]$ordersPath
)

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"
. (Join-Path -Path $runtimePath -ChildPath "Usercube-Visit-Orders.ps1")

function Fulfill-Exchange {
  param ([parameter(Mandatory = $true)] $order)
  
  $changeType = $order.ChangeType
  if ($changeType -ne 'Added' -and $changeType -ne 'Deleted' -and $changeType -ne 'Modified') {
    $artId = $order.AssignedResourceTypeId
    throw "Order ChangeType: $changeType not recognized in AssignedResourceTypeId: '$artId'"
  }
  
  $samAccountName = $order.Changes.SamAccountName
  if (!$samAccountName) {
    $samAccountName = $order.Resource.SamAccountName
    if (!$samAccountName) {
      throw "samAccountName must not be null."
    }
  }
  
  $parameters = @{ }
  $parameters.Identity = $samAccountName
  #$parameters.DomainController = "xxxx"

  $database = $order.Changes.Database.Name
  if ($database) {
    $parameters.Database = $database
  }
  
  if ($changeType -eq 'Added') {
    $primarySmtpAddress = $order.Changes.PrimarySmtpAddress
    if ($primarySmtpAddress) {
      $parameters.PrimarySmtpAddress = $primarySmtpAddress
    }

    #$parameters.RemoteRoutingAddress = $samAccountName + "@xxxx.mail.onmicrosoft.com"

    if ($script:environment -ne "Production") {
      $parameters.HiddenFromAddressListsEnabled = $true
    
      
      #endregion
    }

    Enable-RemoteMailbox @parameters

    if ($script:environment -eq "Production") {
      Set-RemoteMailbox -Identity $parameters.Identity -EmailAddressPolicyEnabled $true -DomainController $parameters.DomainController
    }
    
  }
  elseif ($changeType -eq 'Deleted') {
    Disable-RemoteMailbox -Identity $samAccountName -Confirm:$false
  }
  elseif ($changeType -eq 'Modified') {
    $emailAddresses = $order.Changes.EmailAddresses
    if ($emailAddresses) {
      $parameters.EmailAddresses = $emailAddresses.Split(' ')
    }

    Set-RemoteMailbox @parameters
  }
}

$options = [System.Console]::ReadLine()
$options = ConvertFrom-Json $options

$password = ConvertTo-SecureString $options.Password -AsPlainText -Force
$options.Password = $null

$login = $options.Login
$authType = $options.AuthType
$server = $options.Server

$environment = $options.Environment

if ($authType -ceq "Basic") {
  # Basic Auth needs Login and Password
  $credential = New-Object System.Management.Automation.PSCredential($login, $password)
  $sessionOpt = New-PSSessionOption -SkipCACheck:$true -SkipCNCheck:$true -SkipRevocationCheck:$true
  $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication $authType -Credential $credential -AllowRedirection -SessionOption $sessionOpt
}
else {
  # Default AuthType is Kerberos
  $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos
}

Import-PSSession $session -DisableNameChecking -ErrorAction Stop -AllowClobber
try {
  Usercube-Visit-Orders $resultsFilePath $ordersPath Fulfill-Exchange
}
finally {
  Remove-PSSession $session
}

#
