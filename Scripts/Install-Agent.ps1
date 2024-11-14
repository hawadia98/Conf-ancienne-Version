
. "$PSScriptRoot/Environment.ps1"

Set-Location $runtimePath

Launch-Automaton -jobIdentifier "InitializationJob" -installAgent $true
