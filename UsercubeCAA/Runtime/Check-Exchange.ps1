# This script is not to be modified. Any modification will void the warranty.

param (
    [Parameter(Mandatory = $true)][ValidateSet('Basic','Kerberos')][string]$authType,
    [string]$login,
    [Parameter(Mandatory = $true)][string]$server
    )

    $ErrorActionPreference = "Stop"

    if ($authType -ceq "Basic"){
        [string]$pass = [System.Console]::ReadLine()
        $password = ConvertTo-SecureString $pass -AsPlainText -Force
        $pass = $null
        $credential = New-Object System.Management.Automation.PSCredential($login, $password)        
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos -Credential $credential
    } else {
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $server -Authentication Kerberos
    }

    Import-PSSession $session -DisableNameChecking
    try {
        $databases = Get-MailboxDatabase
        $entityCount = ($databases| Measure-Object).Count
        Write-Host "$entityCount"
    }
    finally {
        Remove-PSSession $session
    }
