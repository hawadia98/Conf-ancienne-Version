<#
.SYNOPSIS
    Installs an On-Premise Usercube instance.

.DESCRIPTION
    Installs an On-Premise Usercube instance :
    - Creates the Usercube database
    - Imports the Usercube configuration
    - Runs the Usercube server
    - Runs the initialization job to initialize the Usercube instance.

    Note that any existing Usercube database instance will be deleted.

    Convenient parameters are provided to skip installation steps which should not run or to run the installation process starting from a given step.
    For more information and examples, type : Get-Help .\Install-OnPremise.ps1 -Detailed

.EXAMPLE
    PS>./Install-OnPremise
    Installs (or re-installs) an On-Premise Usercube instance.

.EXAMPLE
    PS>./Install-OnPremise -From ImportConfiguration
    PS>./Install-OnPremise -NoCreateDatabase
    PS>./Install-OnPremise -ncd

    Installs a Usercube instance while skipping the create database step.
    It may be useful when the configuration import failed and the database does not need to be recreated.

.EXAMPLE
    PS>./Install-OnPremise -NoCreateDatabase -NoImportConfiguration
    PS>./Install-OnPremise -ncd -nic

    Installs a Usercube instance while skipping the create database and import configuration steps.
    It may be useful when the configuration was successfully imported, but the Usercube server failed to startup due to configuration issues.
#>

[CmdletBinding()]
param (
    [Alias('ncd')]
    [Switch]
    # Do not (re)create the Usercube database.
    # Alias : ncd
    $NoCreateDatabase = $false,
    [Alias('nic')]
    [Switch]
    # Do not import Usercube configuration.
    # Alias : nic
    $NoImportConfiguration = $false,
    [Alias('nls')]
    [Switch]
    # Do not launch Usercube-Server.
    # Alias : nls
    $NoLaunchServer = $false,
    [Alias('nij')]
    [Switch]
    # Do not launch initialization job.
    # Alias : nij
    $NoInitializationJob = $false,
    [ValidateSet('ImportConfiguration','LaunchServer','InitializationJob')]
    [string]
    # Runs the installation process starting from a given step.
    # Valid step names are : ImportConfiguration, LaunchServer, InitializationJob
    # Steps are listed in the order they are launched. A given step will automatically trigger the following ones.
    # Any provided 'No<StepName>' flag will take precedence on the steps triggered by the 'From' parameter and the step will be ignored.
    $From
)

. "$PSScriptRoot/Environment.ps1"

Check-Dotnet-Installed

$NoCreateDatabase = $NoCreateDatabase -or $From -ne ''
$NoImportConfiguration = $NoImportConfiguration -or $From -eq 'LaunchServer' -or $From -eq 'InitializationJob'
$NoLaunchServer = $NoLaunchServer -or $From -eq 'InitializationJob'

if ($NoCreateDatabase -eq $false)
{
  & $PSScriptRoot'\Create_Database.ps1'
}

if ($NoImportConfiguration -eq $false)
{
  Launch-ImportConfiguration
}

if ($NoLaunchServer -eq $false)
{
  Launch-Server
}

if ($NoInitializationJob -eq $false)
{
  Launch-Automaton -jobIdentifier "InitializationJob"
}
