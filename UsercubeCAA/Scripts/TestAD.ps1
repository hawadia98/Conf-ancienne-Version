Add-Type -AssemblyName System.DirectoryServices

Function Test-ADUserAuth {
    param(
        [parameter(Mandatory=$true)]
        [string]$ADUserLogin,
        [parameter(Mandatory=$true)]
        [string]$ADUserPassword)

    $authType = [System.DirectoryServices.AuthentificationTypes]::FastBind
    New-Object DirectoryServices.DirectoryEntry("LDAP://10.110.242.67:636/DC=ca-pacificadev,DC=fr", $ADUserLogin, $ADUserPassword)
}

$ADUserLogin = 'CS_DEV_AD'
$ADUserPassword = 'riP7PvmF6NqR1C'

Test-ADUserAuth -ADUserLogin $ADUserLogin -ADUserPassword $ADUserPassword
