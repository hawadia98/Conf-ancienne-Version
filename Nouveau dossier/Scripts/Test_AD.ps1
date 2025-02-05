function Test-ADAuthentication {
	Param(
		[Parameter(Mandatory)]
		[string]$User,
		[Parameter(Mandatory)]
		$Password,
		[Parameter(Mandatory = $false)]
		$Server,
		[Parameter(Mandatory = $false)]
		[string]$Domain = $env:USERDOMAIN
	)
  
	Add-Type -AssemblyName System.DirectoryServices.AccountManagement
	
	$contextType = [System.DirectoryServices.AccountManagement.ContextType]::Domain
	
	$argumentList = New-Object -TypeName "System.Collections.ArrayList"
	$null = $argumentList.Add($contextType)
	$null = $argumentList.Add($Domain)
	$null = $argumentList.Add($Server)
	
	$principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList $argumentList -ErrorAction SilentlyContinue

	if ($null -eq $principalContext) {
		Write-Warning "$Domain\$User - AD Authentication failed"
	}
	
	if ($principalContext.ValidateCredentials($User, $Password)) {
		Write-Host -ForegroundColor green "$Domain\$User - AD Authentication OK"
	}
	else {
		Write-Warning "$Domain\$User - AD Authentication failed"
	}
}


$ADUserLogin = 'CS_DEV_AD'
$ADUserPassword = 'riP7PvmF6NqR1C'
$ADServer = '10.110.242.67:636'
$ADDomain = 'ca-pacificadevd'

Test-ADAuthentication -User $ADUserLogin -Password $ADUserPassword -Server $ADServer -Domain $ADDomain
