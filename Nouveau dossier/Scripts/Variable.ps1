# .SYNOPSIS
# Searches the connection string for the database and server. If there is no result, uses the Search-For-Database-Server function to search environment variables and write them manually if needed.
function Search-in-ConnectionString {
    Param($sqlConnectionString)
    foreach ($part in $sqlConnectionString.Split(";")) {
        if ($part.StartsWith("Database=", "InvariantCultureIgnoreCase") -or $part.StartsWith("Database =", "InvariantCultureIgnoreCase")) {
            $sqlDataBase = $part.Split("=")[1]
            continue
        }
        if ($part.StartsWith("data source=", "InvariantCultureIgnoreCase") -or $part.StartsWith("data source =", "InvariantCultureIgnoreCase")) {
            $sqlServer = $part.Split("=")[1]
            continue
        }
    }
    $sqlDataBase, $sqlServer = Search-For-Database-Server $sqlDataBase $sqlServer
    return $sqlDataBase, $sqlServer
}

# .SYNOPSIS
# Searches for the database and server in environment variables, and writes them manually if they are not part of the environment variables.
function Search-For-Database-Server {
    Param($sqlDataBase, $sqlServer)
    if (!$sqlDataBase) {
        $sqlDataBase = $env:APPSETTING_Database__SqlDataBase
        if (!$sqlDataBase) {
            $sqlDataBase = 'UsercubeCAA'
        }
    }
    if (!$sqlServer) {
        $sqlServer = $env:APPSETTING_Database__SqlServer
        if (!$sqlServer) {
            $sqlServer = '.'
        }
    }
    return $sqlDataBase, $sqlServer
}

$applicationPath = Split-Path $PSScriptRoot -Parent
$sqlDataBase = ''
$sqlServer = ''

$runtimePath = $env:APPSETTING_AppSettings__InstallationDirectoryPath
if (!$runtimePath) {
    $runtimePath = Join-Path -Path $applicationPath -ChildPath "Runtime"
}

$apiUri = $env:ApplicationUri

# Loads the appsettings if the file is found
$appsettingFile = Join-Path -Path $runtimePath -ChildPath "appsettings.json"

try {
    $appsettingsTojson = Get-Content $appsettingFile | ConvertFrom-Json
    $successConvertJson = 1
    Write-Host "Custom configuration successfully loaded from $appsettingFile"
}
catch {
    $successConvertJson = 0
}

if (!$apiUri) {
    if ($successConvertJson) {
        $apiUri = $appsettingsTojson.ApplicationUri
    }
    else {
        $apiuri = 'http://localhost:5000'
    }
}

$sqlConnectionString = $env:ConnectionString

if (!$sqlConnectionString) {
    if ($successConvertJson) {
        $sqlConnectionString = $appsettingsTojson.ConnectionString
    }

    if ($sqlConnectionString) {
        $sqlDataBase, $sqlServer = Search-In-ConnectionString $sqlConnectionString
    }
    else {
        $sqlDataBase, $sqlServer = Search-For-Database-Server $sqlDataBase $sqlServer
        $sqlConnectionString = "data source=$sqlServer;Database=$sqlDatabase;Integrated Security=SSPI;Min Pool Size=10;MultipleActiveResultSets=True;encrypt=false"
    }
}
else {
    $sqlDataBase, $sqlServer = Search-In-ConnectionString $sqlConnectionString
}

$scriptsPath = $env:APPSETTING_AppSettings__ScriptPath
if (!$scriptsPath) {
    $scriptsPath = $PSScriptRoot
}

$confPath = $env:Conf_Path101
if (!$confPath) {
    $confPath = $env:APPSETTING_AppSettings__ConfPath
    if (!$confPath) {
        $confPath = Join-Path -Path $applicationPath -ChildPath "Conf"
    }
}

# Loads the appsettings.agent if the file is found
$appsettingAgentFile = Join-Path -Path $runtimePath -ChildPath "appsettings.agent.json"

try {
    $appsettingsAgentTojson = Get-Content $appsettingAgentFile | ConvertFrom-Json
    $successConvertAgentJson = 1
    Write-Host "Custom configuration successfully loaded from $appsettingAgentFile"
}
catch {
    $successConvertAgentJson = 0
}

$apiUriObject = [System.Uri] $apiUri
$clientId = 'Job@' + $apiUriObject.Authority

if (!$clientSecret) {
    if ($successConvertAgentJson) {
        $clientSecret = $appsettingsAgentTojson.OpenId.OpenIdClients.Job
    }
}

$exeConfiguration = Join-Path -Path $runtimePath -ChildPath "Usercube-Deploy-Configuration.exe"
$exeAutomatonLaunch = Join-Path -Path $runtimePath -ChildPath "Usercube-Invoke-Job.exe"
$exeAgent = Join-Path -Path $runtimePath -ChildPath "Usercube-Agent.exe"
$decryptFilesExe = Join-Path -Path $runtimePath -ChildPath "Usercube-Decrypt-File.exe"

Write-Host "Installation will run with following context variables :"
Write-Host "- scriptsPath : $scriptsPath"
Write-Host "- confPath : $confPath"
Write-Host "- apiUri : $apiuri"
