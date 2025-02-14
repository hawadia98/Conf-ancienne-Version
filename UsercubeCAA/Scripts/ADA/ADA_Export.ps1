$apiPath = '/api/Resource/Directory_User?api-version=1.0'
$path = '/Custom/Resources/Directory_User/View&QueryRootEntityType=Directory_User'
$url = 'https://dev-fusion-iam.caa.group.gca'
$squery = 'join MainRecord mr join mr.Company c join mr.ContractType mrc join mrc.UserType mrcu join mr.Site mrs join AssignedSingleRoles asr join asr.Role asrr join asrr.Category asrrc select mr.FirstName, mr.LastName, mr.EmployeeId, mr.Email, mr.ContractStartDate, mr.ContractEndDate, c.DisplayName, mrs.DisplayName, mrcu.DisplayName, asrr.DisplayName, asrrc.DisplayName order by Id asc'
$continuationToken = ''
$pageSize = 10000
$timestamp = Get-Date -Format "MM-dd-yyyy"
$outputFile = "D:\UsercubeCAA\Sources\ADA\Export\Export_ADA_$timestamp.csv"

$apiUrl = $url + $apiPath + '&path=' + $path + '&squery=' + $squery + '&PageSize=' + $pageSize + '&ContinuationToken='

$tokenUrl = 'https://dev-fusion-iam.caa.group.gca/connect/token'
$bodyToken = "client_id=Job@dev-fusion-iam.caa.group.gca&client_secret=secret&scope=usercube_api&grant_type=client_credentials"

try {

    Write-Host $tokenUrl

    $token = (Invoke-RestMethod -Uri $tokenUrl -Method POST -Body $bodyToken).access_token

}

catch {
    
    $errorMessage = $_.Exception.Message

    Throw $errorMessage

}

Write-Host $token

$retries = 2

$firstCall = $true

$writer = New-Object System.IO.StreamWriter($outputFile, $false, ([System.Text.Encoding]::UTF8))

$headers = @('Nom', 'Prenom', 'Date de debut' ,'Date de fin', 'Adresse email', 'Site', 'Societe', 'Service', 'Role(s)', 'Description', 'sys_id')

$writer.WriteLine('{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10}', $headers)

do

{

    while (![string]::IsNullOrEmpty($continuationToken) -or $firstCall) {

        try {

            if ($firstCall) {

                $continuationToken = ''

                $firstCall = $false

            }

            $results = Invoke-RestMethod -Uri ($apiUrl + $continuationToken) -Method 'GET' -headers @{Authorization = 'Bearer ' + $token}

            $retries = 1

            $continuationToken = $results.ContinuationToken

            foreach($entry in $results.Result){

                $assignedRoles = $entry.AssignedSingleRoles
                
                if($assignedRoles -eq $null){continue}
                $RoleTab = ""
                foreach($assigned in $assignedRoles.Role.DisplayName){
                    $RoleTab += "$assigned | "

                }

                $RoleTab = $RoleTab.Substring(0,$RoleTab.Length - 3)

                $ContractStartFormat = $entry.MainRecord.ContractStartDate

                if($ContractStartFormat -ne $null){
                    $ContractStartFormat = $ContractStartFormat.Substring(0,$ContractStartFormat.Length - 14)

                }

                $ContractEndFormat = $entry.MainRecord.ContractEndDate

                if($ContractEndFormat -ne $null){
                    $ContractEndFormat = $ContractEndFormat.Substring(0,$ContractEndFormat.Length - 14)

                }

                $Description = " "
                Write-Host $entry.MainRecord.FirstName
                $values = @($entry.MainRecord.LastName, $entry.MainRecord.FirstName, $ContractFormat, $ContractEndFormat, $entry.MainRecord.Email, $entry.MainRecord.Site.DisplayName, $entry.MainRecord.Company.DisplayName, $entry.MainRecord.ContractType.UserType.DisplayName, $RoleTab, $Description, $entry.MainRecord.EmployeeId)
                $writer.WriteLine('{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10}', $values)
            }
        }
        catch {

            Write-Host -ForegroundColor Red "Error Usercube API"

            Write-Host $_

            $retries--

        }
    }
    $writer.Close()
}

While ($continue -and $retries -ge 0)