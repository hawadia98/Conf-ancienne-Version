# This script is not to be modified. Any modification will void the warranty.

param (
    [Parameter(Mandatory = $true)][ValidateSet('Basic','Kerberos')][string]$authType,
    [string]$login,
    [switch]$useSecureString,
    [Parameter(Mandatory = $true)][string]$server,
    [Parameter(Mandatory = $true)][string]$cookieDateString,
    [Parameter(Mandatory = $true)][string]$currentDateString,
    [Parameter(Mandatory = $true)][string]$mailboxesCsvPath,
    [Parameter(Mandatory = $true)][string]$databasesCsvPath,
    [Parameter(Mandatory = $true)][int]$resultSize
    )
    
    # Every error will throw an exception and stop the script
    $ErrorActionPreference = "Stop"

    function Get-SecureString {
        param (
            [Parameter(Mandatory = $true)][bool]$useSecureStringBool
        )
        
        if($useSecureStringBool){
            $password = Read-Host -AsSecureString
        } else {
            [string]$pass = [System.Console]::ReadLine()
            $password = ConvertTo-SecureString $pass -AsPlainText -Force
            $pass = $null
        }
        
        return $password
    }

    function Remove-Csv {
        param (
            [Parameter(Mandatory = $true)][string]$csvFilePath
        )
        
        if (Test-Path $csvFilePath) {
            Remove-Item $csvFilePath
            Write-Host "File $csvFilePath removed"
        }
    }

    function Remove-Process {
        param (
            [Parameter(Mandatory = $true)]$process
        )
        
        $processName = $process.ProcessName
        $processId = $process.Id
        $process.StandardInput.Close()
        Write-Host "Process $processName with PID $processId waiting for exit"
        $process.WaitForExit()
        $process.Dispose()
        Write-Host "Process $processName with PID $processId disposed"
    }

    function New-Csv {
        param (
            [Parameter(Mandatory = $true)]$stream,
            [Parameter(Mandatory = $true)]$filterArray,
            [Parameter(Mandatory = $true)][string]$separator
        )
        
        $filterString = $filterArray -join $separator
        $stream.WriteLine('"Command"' + $separator + '"' + $filterString.Replace($separator, '"' + $separator + '"') + '"')
    }

    function Add-Csv {
        param (
            [Parameter(Mandatory = $true)]$entity,
            [Parameter(Mandatory = $true)]$stream,
            [Parameter(Mandatory = $true)]$filterArray,
            [Parameter(Mandatory = $true)][string]$csvFilePath,
            [Parameter(Mandatory = $true)][string]$separator,
            [Parameter(Mandatory = $true)][datetime]$cookieDate,
            [Parameter(Mandatory = $true)][string]$commandInsert,
            [Parameter(Mandatory = $true)][string]$commandUpdate
        )
    
        $entityCount = ($entity| Measure-Object).Count
        
        $combined = @()
        # New entity
        $combined += $entity | Where-Object {$_.WhenCreatedUTC -ge $cookieDate} | Select-Object -Property (, @{Name = 'Command'; Expression = { $commandInsert } } + $filterArray)
        # Updated entity
        $combined += $entity | Where-Object {$_.WhenCreatedUTC -lt $cookieDate} | Select-Object -Property (, @{Name = 'Command'; Expression = { $commandUpdate } } + $filterArray)
        # Write results (append) to CSV
        for ($i = 0; $i -lt $entityCount; $i++){
            $msg = ConvertTo-Csv -InputObject ($combined[$i]) -Delimiter $separator -NoTypeInformation
            # $msg[0] contains the headers and $msg[1] contains the values
            $stream.WriteLine($msg[1])
        }

        # Send progress to C# code for the progress Report()
        Write-Host "Progress: $entityCount"
        Write-Host "$entityCount lines added to the CSV file $csvFilePath"
    }

    function New-ProcessStartInfo {
        param (
            [Parameter(Mandatory = $true)][string]$csvFilePath
        )
        
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        # Encrypt exe
        $psi.FileName = Join-Path -Path $PSScriptRoot -ChildPath "Usercube-Encrypt-File.exe"
        # Result CSV file
        $psi.Arguments = "-o $csvFilePath"
        $psi.UseShellExecute = $false
        $psi.CreateNoWindow = $true
        # Enable the process to read from standard input
        $psi.RedirectStandardInput = $true
        return $psi
    }

    # Connect to the Exchange Server
    if ($authType -ceq "Basic"){
        $password = Get-SecureString -useSecureStringBool $useSecureString.IsPresent
        $credential = New-Object System.Management.Automation.PSCredential($login, $password)
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos -Credential $credential
    } else {
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos
    }
    
    $process = $null
    Import-PSSession $session -DisableNameChecking
    try {
        # CSV separator
        $separator = ','
        # Convert cookieDate to UTC time
        $cookieDate = (Get-Date $cookieDateString).ToUniversalTime()
        $defaultDate = ([datetime]::FromFileTime(0)).ToUniversalTime()
        # Complete -> write "INSERT", "INSERT" in CSV
        # Incremental -> write "INSERT", "UPDATE" in CSV
        $commandInsert = "INSERT"
        if ($cookieDate -gt $defaultDate){
            $commandUpdate = "UPDATE"
        } else {
            $commandUpdate = "INSERT"
        }
        
        # Delete old csv files
        Remove-Csv -csvFilePath $databasesCsvPath
        Remove-Csv -csvFilePath $mailboxesCsvPath
        
        # Columns of the csv file (the column command is added at the end)
        $filterArray = "Name", "Server", "Mounted", "ObjectCategory", "Guid", "WhenChangedUTC", "WhenCreatedUTC", "ObjectState"
        # Get databases updated after the cookieDate
        Write-Host "Calling Get-MailboxDatabase"
        $databases = Get-MailboxDatabase | Where-Object {$_.WhenChangedUTC -gt $cookieDate}

        # Create the process Usercube-Encrypt-File.exe
        $psi = New-ProcessStartInfo -csvFilePath $databasesCsvPath
        # Start the process
        $process = [System.Diagnostics.Process]::Start($psi)
        Write-Host "Process $($process.ProcessName) with PID $($process.Id) started"

        New-Csv -stream $process.StandardInput -filterArray $filterArray -separator $separator
        if (!$databases){
            Write-Host "No database found"
        } else {
            Add-Csv -entity $databases -stream $process.StandardInput -filterArray $filterArray -csvFilePath $databasesCsvPath -separator $separator -cookieDate $cookieDate -commandInsert $commandInsert -commandUpdate $commandUpdate
        }

        # Dispose the process
        Remove-Process -process $process
        $process = $null
        
        # Columns of the csv file (the column command is added at the end)
        $filterArray = "Database", "EmailAddresses", "UseDatabaseRetentionDefaults", "RetainDeletedItemsUntilBackup", "DeliverToMailboxAndForward", "ExchangeGuid", "ExchangeUserAccountControl", "ForwardingAddress", "ForwardingSmtpAddress", "IsMailboxEnabled", "ProhibitSendQuota", "ProhibitSendReceiveQuota", "RecoverableItemsQuota", "RecoverableItemsWarningQuota", "CalendarLoggingQuota", "IsResource", "IsLinked", "IsShared", "SamAccountName", "AntispamBypassEnabled", "ServerName", "UseDatabaseQuotaDefaults", "UserPrincipalName", "WhenMailboxCreated", "IsInactiveMailbox", "AccountDisabledIsDirSynced", "Alias", "OrganizationalUnit", "DisplayName", "MaxSendSize", "MaxReceiveSize", "PrimarySmtpAddress", "RecipientType", "RecipientTypeDetails", "Identity", "IsValid", "Name", "DistinguishedName", "Guid", "ObjectCategory", "WhenChangedUTC", "WhenCreatedUTC", "ObjectState"
        # Get mailboxes updated after the cookieDate
        $firstPage = $true
        $continueLoop = $true
        $filterMailbox = "WhenChangedUTC -ge '$cookieDateString' -and WhenChangedUTC -lt '$currentDateString'"
        Write-Host "Batch calling Get-Mailbox"

        # Creates the process Usercube-Encrypt-File.exe
        $psi = New-ProcessStartInfo -csvFilePath $mailboxesCsvPath
        # Start the process
        $process = [System.Diagnostics.Process]::Start($psi)
        Write-Host "Process $($process.ProcessName) with PID $($process.Id) started"

        New-Csv -stream $process.StandardInput -filterArray $filterArray -separator $separator
        Do {
            $mailboxes = Get-Mailbox -resultSize ($resultSize + 1) -Filter $filterMailbox -SortBy "Name" -WarningAction 0
            $mailboxesCount = ($mailboxes| Measure-Object).Count

            if (!$mailboxes){
                $continueLoop = $false
                if ($firstPage){
                    Write-Host "No mailbox found"
                }
            } else {
                # There are only one principal address (SMTP:) and one proxy address (smtp:)
                # Sorting order is first principal and second proxy
                Foreach ($mailbox in $mailboxes) {
                    $proxyAddresses =  $mailbox.EmailAddresses.Split(' ')
                    if ($proxyAddresses.Length -gt 1){
                        if ($proxyAddresses[0] -cmatch "SMTP:"){
                            $mailbox.EmailAddresses = $proxyAddresses[0] + ' ' + $proxyAddresses[1]
                        } else {
                            $mailbox.EmailAddresses = $proxyAddresses[1] + ' ' + $proxyAddresses[0]
                        }
                    }
                }
                
                if ($mailboxesCount -lt ($resultSize + 1)){
                    $continueLoop = $false
                    $entityCount = Add-Csv -entity $mailboxes -stream $process.StandardInput -filterArray $filterArray -csvFilePath $mailboxesCsvPath -separator $separator -cookieDate $cookieDate -commandInsert $commandInsert -commandUpdate $commandUpdate
                } else {
                    $adName = ($mailboxes[$mailboxesCount - 1] | Select-Object -Property "Name").Name
                    $filterMailbox = "WhenChangedUTC -ge '$cookieDateString' -and WhenChangedUTC -lt '$currentDateString' -and Name -ge '$adName'"
                    $entityCount = Add-Csv -entity $mailboxes[0..($mailboxesCount - 2)] -stream $process.StandardInput -filterArray $filterArray -csvFilePath $mailboxesCsvPath -separator $separator -cookieDate $cookieDate -commandInsert $commandInsert -commandUpdate $commandUpdate
                }
            }
            
            $firstPage = $false
        } while ($continueLoop)
        
        # Dispose the process
        Remove-Process -process $process
        $process = $null
    }
    finally {
        # Disconnect the remote PowerShell session because total number sessions is limited
        Remove-PSSession $session
        if ($process){
            Remove-Process -process $process
        }
    }

    #
