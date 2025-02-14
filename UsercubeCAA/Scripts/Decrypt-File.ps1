. "$PSScriptRoot/Environment.ps1"

$file = "C:\Applications\UsercubeCAA\Work\ProvisioningOrders\14\Downloaded\309024_311139.json"
$output = "C:\Temp"
Decrypt-File -file $file -output $output
