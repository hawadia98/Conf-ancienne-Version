[CmdletBinding()]

param(
  [Parameter(Mandatory)][string]$resultsFilePath, 
  [Parameter(Mandatory)][string]$ordersPath
)
#resultsFilePathest le chemin côté agent du fichier de résultats contenant le résumé des commandes exécutées et erronées.
#ordersPathest le chemin du dossier côté agent contenant les commandes de provisionnement JSON.

. (Join-Path -Path $PSScriptRoot -ChildPath "Variable.ps1")
. (Join-Path -Path $runtimePath -ChildPath "Usercube-Visit-Orders.ps1")

#Set-ExecutionPolicy Bypass -Scope Process -Force
function Fulfill-CSV {
    param ([parameter(Mandatory = $true)] $order)
  
    $changeType = $order.ChangeType
    # if the change type is not recognized, we throw an error
    if ($changeType -ne 'Added' -and $changeType -ne 'Deleted' -and $changeType -ne 'Modified') {
      $artId = $order.AssignedResourceTypeId
      throw "Order ChangeType: $changeType not recognized in AssignedResourceTypeId: '$artId'"
    }
  
    # if the section is Changes, we want to create/update the sys_id
    $sys_id = $order.Changes.sys_id
    if(!$sys_id){
      # if the section is Resources, we want to keep the same sys_id
      $sys_id = $order.Resource.sys_id
      if(!$sys_id){
        throw "sys_id is the primary key and must not be null."
      }
    }
  
    # the other properties of the ResourceType
    $sys_id = $order.Changes.sys_id
    $user_name = $order.Changes.user_name
    $email = $order.Changes.email
    $name = $order.Changes.name
    $group = $order.Changes.group
  
    # change type defines what is written in the 'command' column
    if ($changeType -eq 'Added') {
      $command = "Insert"
    }
    elseif ($changeType -eq 'Deleted') {
      $command = "Delete"
    }
    elseif ($changeType -eq 'Modified') {
      $command = "Update"
    }
  
    # CSV columns 
    $script:powershellResults += New-Object -TypeName psobject -Property @{Command = "$command"; sys_id = "$sys_id"; user_name = "$user_name" ; name = "$name"; email = "$email"; group = "$group"}
  }
  
  # Main script
  
  # Just to show how to read the options in the script
  $options = [System.Console]::ReadLine()
  $options = ConvertFrom-Json $options
  $options.Message # -> Hello
  
  # The goal of the script is to write the users in the following CSV file
  $powershellResultFilePath = Join-Path -Path "$demoPath" -ChildPath "Temp/ExportOutput/ServiceNowExportFulfillment_sys_user.csv"
  
  # powershellResults has a larger scope and is used in the last line of the Fulfill-CSV function
  $powershellResults = @()
  
  # Usercube-Visit-Orders is provided by Usercube, it must not be modified
  # It loops on the provisioning orders and calls Fulfill-CSV on each of them
  Usercube-Visit-Orders $resultsFilePath $ordersPath Fulfill-CSV
  
  # We write the results in $powershellResultFilePath
  if ($powershellResults.Length -gt 0){
    $powershellResults | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | & (Join-Path -Path "$runtimePath" -ChildPath "Usercube-Encrypt-File.exe") -o $powershellResultFilePath
  }