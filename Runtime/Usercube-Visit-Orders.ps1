# This script is not to be modified.  Any modification will void the warranty.

#
# Usercube-Visit-Orders invokes a function per pending provisioning order
# and collect all the execution/error status.
#
function Usercube-Visit-Orders {
  param (
    [Parameter(Mandatory = $true)]$resultsFile,
    [Parameter(Mandatory = $true)]$ordersPath,
    [Parameter(Mandatory = $true)]$visitor
  )

  # CSV separator
  $separator = ','

  # Create 'Completed' folder in the working directory
  $completedOrdersPath = Join-Path -Path $ordersPath -ChildPath "Completed"
  if (-not (Test-Path $completedOrdersPath)) {
    New-Item -ItemType Directory -Force -Path $completedOrdersPath | Out-Null
  }

  # List of the provisioning orders' results.
  $results = @()

  # Enumerate all the batched orders
  $ordersFiles = Get-ChildItem (Join-Path -Path $ordersPath -ChildPath "*.json")
  $ordersFilesCount = ($ordersFiles | Measure-Object).Count
  for ($i = 0; $i -lt $ordersFilesCount; $i++) {
    # A json file
    $ordersFile = $ordersFiles[$i].FullName

    # Parse the JSON file and decrypt it on the fly if needed
    try {
    $ordersBlock = & (Join-Path -Path $PSScriptRoot -ChildPath "Usercube-Decrypt-File.exe") -f $ordersFile | ConvertFrom-Json
    }
    catch {
      # There is a problem while parsing the json => log the error and stop the job
      Write-Error $_
      exit -1
      return
    }
    # Prevent the orders from being executed again
    Move-Item -Force -Path $ordersFile -Destination (Join-Path -Path $completedOrdersPath -ChildPath $ordersFiles[$i].Name)

    # The orders in a JSON file
    $orders = $ordersBlock.ProvisioningOrdersList
    $ordersCount = ($orders | Measure-Object).Count
    if ($ordersCount -eq 0) { continue }

    # Update ordersCount value in C#
    Write-Host ('OrdersCount:' + $ordersCount)
    # executedOrdersCount will be updated with a ratio of 10%
    $ratio = [Math]::Ceiling($ordersCount * 0.10)
    # Number of errored orders will be substracted before sending the Progress
    $errored = 0
    # For each order, update progress, execute visitor and track the errors if any
    for ($j = 0; $j -lt $ordersCount; $j++) {
      $order = $orders[$j]

      # These values will be written in the final csv
      $executionId = $order.AssignedResourceTypeId
      $ownerId = $order.Owner.Id
      $ownerType = $order.ResourceType.SourceEntityType.Id
      $executionState = 'Executed'
      $executionMessage = $null
      $executionType = $order.ChangeType
      $output = $null
      try {
        # Call the provisioning function
        $output = & $visitor $order 2>&1
        $stdout = $output | Where-Object { $_ -isnot [System.Management.Automation.ErrorRecord] }
        $stderr = $output | Where-Object { $_ -is [System.Management.Automation.ErrorRecord] }

        # LogInformation
        if ($stdout -and ($stdout.Length -gt 0)) {
          Write-Host $stdout
        }

        # When Write-Error is used in the visitor function
        # LogError
        if ($stderr -and ($stderr.Length -gt 0)) {
          $executionState = 'Errored'
          $executionMessage = ''
          # Several Write-Error
          for ($k = 0; $k -lt $stderr.Length; $k++) {
            if ($k -gt 0) {
              $executionMessage += "`n"
            }

            $executionMessage += $stderr[$k].ToString()
          }

          # LogInformation(AssignedResourceTypeId) when there's an error
          Write-Host "`n"
          Write-Host ('Executing order: ' + $order.AssignedResourceTypeId + ' ChangeType: ' + $order.ChangeType)
          # LogError(executionMessage)
          Write-Error $executionMessage
          $errored++
        }
      }
      catch {
        # When Throw is used in the visitor function or an exception is raised
        # LogError
        $executionState = 'Errored'
        $executionMessage = $output
        $executionMessage += $_.Exception.Message

        # LogInformation(AssignedResourceTypeId) when there's an error
        Write-Host "`n"
        Write-Host ('Executing order: ' + $order.AssignedResourceTypeId + ' ChangeType: ' + $order.ChangeType)
        # LogError(executionMessage) => exception message
        Write-Error $executionMessage
        $errored++
      }

      if (($j + 1) % $ratio -eq 0) {
        # ratio is reached
        $executedOrdersCount = $ratio - $errored
        Write-Host ('Progress:' + $executedOrdersCount)
        $errored = 0
      }
      elseif ((($j + 1) % $ratio -ne 0) -and (($j + 1) -eq $ordersCount)) {
        # ratio is not reached but these are the last orders
        $executedOrdersCount = (($j + 1) % $ratio) - $errored
        Write-Host ('Progress:' + $executedOrdersCount)
        $errored = 0
      }

      $results += New-Object -TypeName psobject -Property @{AssignmentId = $executionId; ProvisioningState = $executionState; Message = $executionMessage; ChangeType = $executionType; OwnerId = $ownerId; OwnerType = $ownerType; }
    }
  }

  $results | ConvertTo-Csv -Delimiter $separator -NoTypeInformation | & (Join-Path -Path $PSScriptRoot -ChildPath "Usercube-Encrypt-File.exe") -o $resultsFile
}

#
