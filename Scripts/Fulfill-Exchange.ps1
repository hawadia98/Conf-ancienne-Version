#
param(
  [Parameter(Mandatory = $true)][string]$resultsFilePath,
  [Parameter(Mandatory = $true)][string]$ordersPath
)

. (Join-Path -Path $PSScriptRoot -ChildPath "Environment.ps1")
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
  
  $database = $order.Changes.Database.Name
  if ($database) {
    $parameters.Database = $database
  }
  
  if ($changeType -eq 'Added') {
    $primarySmtpAddress = $order.Changes.PrimarySmtpAddress
    if ($primarySmtpAddress) {
      $parameters.PrimarySmtpAddress = $primarySmtpAddress
    }
    
    Enable-Mailbox @parameters -Force
  }
  elseif ($changeType -eq 'Deleted') {
    Disable-Mailbox -Identity $samAccountName -Confirm:$false
  }
  elseif ($changeType -eq 'Modified') {
    $emailAddresses = $order.Changes.EmailAddresses
    if ($emailAddresses) {
      $parameters.EmailAddresses = $emailAddresses.Split(' ')
    }

    Set-Mailbox @parameters -Force
  }
}

$options = [System.Console]::ReadLine()
$options = ConvertFrom-Json $options

$password = ConvertTo-SecureString $options.Password -AsPlainText -Force
$options.Password = $null

$login = $options.Login
$authType = $options.AuthType
$server = $options.Server

if ($authType -ceq "Basic") {
  # Basic Auth needs Login and Password
  $credential = New-Object System.Management.Automation.PSCredential($login, $password)
  $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos -Credential $credential
}
else {
  # Default AuthType is Kerberos
  $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos
}

Import-PSSession $session -DisableNameChecking
try {
  Usercube-Visit-Orders $resultsFilePath $ordersPath Fulfill-Exchange
}
finally {
  Remove-PSSession $session
}

#
