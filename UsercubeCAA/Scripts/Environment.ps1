. "$PSScriptRoot/Variable.ps1"

function Check-Error-Code {
    Param([parameter(position = 1, Mandatory = $true)][string]$command)
    if ($LastExitCode -ne 0 ) {
        Write-Error "Error with this command : $command"
        Write-Error "Error code : $LastExitCode"
        exit $LastExitCode
    }
}

<#
    .SYNOPSIS
    Run a specified command contained in a string and exit the script with non-zero exit code if the executed command returned an exception
#>
function Invoke-Expression-With-Exit-Code {
    Param([parameter(position = 1, Mandatory = $true)][string]$command)
    try {
         Invoke-Expression($command)
    }
    catch {
        Write-Error 'Error with this command : ' $command
        exit 1
    }
}

function Launch-ImportConfiguration() {
    Param([parameter(position = 1, Mandatory = $false)][string]$configurationPath = $confPath)
    $command = $exeConfiguration + ' --database-connection-string "' + $sqlConnectionString + '" --configuration-directory "' + $configurationPath + '"' + ' --force-cascade-delete'
    Invoke-Expression-With-Exit-Code($command)
}

function Launch-Server {
    $exeClient = ".\Usercube-Server.exe"
    Write-Host "Usercube-Server.exe : Start"
    Start-Process -FilePath "powershell" -argumentlist "-noexit ", $exeClient -WorkingDirectory $runtimePath
    Start-Sleep -s 5
    Check-Error-Code($exeClient)
}

function Launch-Automaton {
    Param([parameter(position = 1, Mandatory = $true)][string]$jobIdentifier,
    [parameter(position = 2, Mandatory = $false)][bool]$installAgent = $false)
    $command = $exeAutomatonLaunch + " --job-identifier '" + $jobIdentifier + "'" + " --api-secret '" + $clientSecret + "' --api-client-id '" + $clientId + "' --api-url " + $apiUri
    $command
    if($installAgent){
        Invoke-Expression-With-Exit-Code($command)
    }
    else{
        Start-Process -FilePath "powershell" -argumentlist "-noexit ", $command -WorkingDirectory $runtimePath
        Check-Error-Code($command)
    }
}

function Decrypt-File {
    Param([parameter(position = 1, Mandatory = $true)][string]$file,
    [parameter(position = 2, Mandatory = $true)][string]$output)
    $command = $decryptFilesExe + ' --files "' + $file + ' --output-path "' + $output + '"'
    Start-Process -FilePath "powershell" -argumentlist "-noexit ", $command -WorkingDirectory $runtimePath
}
