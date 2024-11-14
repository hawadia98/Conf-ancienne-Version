param(
	[Parameter(Mandatory = $false)]
	[string]$dataBaseName
)

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null

#Add-Type -Path 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\Extensions\Microsoft\SQLCommon\140\Microsoft.SqlServer.BatchParser.dll'
  $assemblylist =
"Microsoft.SqlServer.Management.Common",
"Microsoft.SqlServer.Smo",
"Microsoft.SqlServer.Dmf ",
"Microsoft.SqlServer.Instapi ",
"Microsoft.SqlServer.SqlWmiManagement ",
"Microsoft.SqlServer.ConnectionInfo ",
"Microsoft.SqlServer.SmoExtended ",
"Microsoft.SqlServer.SqlTDiagM ",
"Microsoft.SqlServer.SString ",
"Microsoft.SqlServer.Management.RegisteredServers ",
"Microsoft.SqlServer.Management.Sdk.Sfc ",
"Microsoft.SqlServer.SqlEnum ",
"Microsoft.SqlServer.RegSvrEnum ",
"Microsoft.SqlServer.WmiEnum ",
"Microsoft.SqlServer.ServiceBrokerEnum ",
"Microsoft.SqlServer.ConnectionInfoExtended ",
"Microsoft.SqlServer.Management.Collector ",
"Microsoft.SqlServer.Management.CollectorEnum",
"Microsoft.SqlServer.Management.Dac",
"Microsoft.SqlServer.Management.DacEnum",
"Microsoft.SqlServer.Management.Utility"

foreach ($asm in $assemblylist)
{
   [Reflection.Assembly]::LoadWithPartialName($asm)
}
$environmentPath = Split-Path $PSScriptRoot -Parent

. "$PSScriptRoot/Environment.ps1"
##############################
#Path

# If the option isn't set then retrieve $sqlDataBase from variable.ps1 (appsettings.json)
if ($dataBaseName)
{
	$sqlDataBase = $dataBaseName
}

$path_size = $environmentPath + "\Scripts\Size_DataBase.sql"
$path_table = "$environmentPath/Runtime/Usercube.sql"
Copy-Item -Path $PSScriptRoot"\Size_DataBaseTemplate.sql" -Destination $PSScriptRoot"\Size_DataBase.sql" -Force
Set-Content $PSScriptRoot"\Size_DataBase.sql" (Get-Content $PSScriptRoot"\Size_DataBase.sql").replace("##DATABASESQL##",$sqlDataBase)
###############################
#Create DataBase
$srv = new-Object Microsoft.SqlServer.Management.Smo.Server($sqlServer)
	Try{
		if ( $null -ne $srv.Databases[$sqlDataBase] )
		{
			$srv.KillAllProcesses($sqlDataBase)
			$srv.Databases[$sqlDataBase].Drop()
		}

	}
	catch{
		$ErrorMessage = $_.Exception.Message
		Write-Host "exception error : Database already created - Drop it ..."+ $ErrorMessage

	}
$db = New-Object Microsoft.SqlServer.Management.Smo.Database($srv ,$sqlDataBase)
	 Try{

		 $db.Create()
		 Write-Host "DataBase : Created"

 }
	 catch{
		 $ErrorMessage = $_.Exception.Message
		 Write-Host "db.Create error 2"+ $ErrorMessage
	 }

	 Try{
	Invoke-Sqlcmd -ServerInstance $sqlServer -Database $sqlDataBase -InputFile $path_size -ConnectionTimeout 10 -QueryTimeout 120
	Write-Host "Size Database : Modified"
 }
	 catch{
		$ErrorMessage = $_.Exception.Message
		Write-Host "exception error : Edit size failed"+ $ErrorMessage
	 }

Try{
	Invoke-Sqlcmd -ServerInstance $sqlServer -Database $sqlDataBase -InputFile $path_table -ConnectionTimeout 10 -QueryTimeout 120
	Write-Host "Usercube.sql : done"
}
catch{
    $ErrorMessage = $_.Exception.Message
	Write-Host "exception error : Request Usercube.sql failed"+ $ErrorMessage
}


