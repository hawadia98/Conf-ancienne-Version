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

function Launch-AutomatonBySteps {
    Param([parameter(position = 1, Mandatory = $true)][string]$jobIdentifier,
    [parameter(position = 2, Mandatory = $false)][int]$begin = $false,
    [parameter(position = 2, Mandatory = $false)][int]$end = $false)
    $command = $exeAutomatonLaunch + " --job-identifier '" + $jobIdentifier + "'" + " -b " + $begin + " -e " + $end + " --api-secret '" + $clientSecret + "' --api-client-id '" + $clientId + "' --api-url " + $apiUri
    Invoke-Expression-With-Exit-Code($command)
}

function Launch-AutomatonBeginExclude {
    Param([parameter(position = 1, Mandatory = $true)][string]$jobIdentifier,
    [parameter(position = 2, Mandatory = $false)][string]$begin = $false)
    $command = $exeAutomatonLaunch + " --job-identifier '" + $jobIdentifier + "'" + " -be " + $begin + " --api-secret '" + $clientSecret + "' --api-client-id '" + $clientId + "' --api-url " + $apiUri
    Invoke-Expression-With-Exit-Code($command)
}

function Launch-AutomatonBeginEndExclude {
    Param([parameter(position = 1, Mandatory = $true)][string]$jobIdentifier,
    [parameter(position = 2, Mandatory = $false)][string]$begin = $false,
    [parameter(position = 3, Mandatory = $false)][string]$end = $false)
    $command = $exeAutomatonLaunch + " --job-identifier '" + $jobIdentifier + "'" + " -be " + $begin + " -ee " + $end + " --api-secret '" + $clientSecret + "' --api-client-id '" + $clientId + "' --api-url " + $apiUri
    Invoke-Expression-With-Exit-Code($command)
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
    & "$scriptsPath/check-website-availability.ps1"
    Check-Error-Code($exeClient)
}

function Launch-Agent {
    Param([parameter(position = 1, Mandatory = $true)][string]$Url)
    $command = '"' + $exeAgent + ' --urls ' + $Url + '"'
    Start-Process -FilePath "powershell" -argumentlist $command -WorkingDirectory $runtimePath
}

function Decrypt-File{
    Param([parameter(position = 1, Mandatory = $true)][string]$file)
    $command = $decryptFilesExe + ' --file-cert-file "' + $certificateFilePath + '" --file-cert-password "' + $certificatePassword + '" --files ' + $file
    Start-Process -FilePath "powershell" -argumentlist "-noexit ", $command -WorkingDirectory $runtimePath
}

function Check-Dotnet-Installed{
	try { dotnet --version }
	catch { Write-Host -ForegroundColor Red -BackgroundColor Black '`dotnet` command not found.
	1. Install dotnet runtime
	2. Verify that directory of dotnet executable is in PATH environment variable (`$env:path`)
	3. Restart console so that PATH is updated in the shell environment
	Aborting...'
	break
	}
}
