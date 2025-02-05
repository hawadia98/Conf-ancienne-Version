#Construction des parametres du call API GET person

$apiPath = '/api/Resource/Directory_User?api-version=1.0'
$path = '/Custom/Resources/Directory_User/View&QueryRootEntityType=Directory_User'
$url = 'https://dev-fusion-iam.caa.group.gca'
$squery = 'join MainRecord r join PresenceState p join r.Title rt join r.Organization o join r.Manager mr join mr.MainRecord mrr join r.Company c select r.FirstName, r.LastName, r.Email, r.EmployeeId, c.DisplayName, mrr.FirstName, mrr.LastName, o.Identifier, o.TranscoCode, rt.DisplayName where (c.DisplayName != "CAAS" and o.DisplayName != "S80" and p.Identifier="P") order by Id asc'
$continuationToken = ''
$pageSize = 10000
$timestamp = Get-Date -Format "MM-dd-yyyy"
$outputFile = "D:\\UsercubeCAA\Sources\RCI\Export\Export_RCI_Person_$timestamp.csv"

#Construction du call API GET ADA Accounts

$apiUrl = $url + $apiPath + '&path=' + $path + '&squery=' + $squery + '&PageSize=' + $pageSize + '&ContinuationToken='

Write-Host $apiUrl -ForegroundColor Cyan
#Call POST pour obtenir l'access token

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

$headers = @('uid', 'sn', 'givenname', 'o', 'telephoneNumber', 'caPersonId', 'departmentNumber', 'title','mail','physicalDeliveryOfficeName','nomResponsable','prenomResponsable','caParamater')

$writer.WriteLine('{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11};{12}', $headers)

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



            foreach ($entry in $results.Result) {

                $caPersonId = "IUG$"+$entry.MainRecord.EmployeeId
                $caParameter = 'RCI_affichage$oui'
                $values = @($entry.MainRecord.Organization.Identifier, $entry.MainRecord.LastName, $entry.MainRecord.FirstName, $entry.MainRecord.Company.DisplayName," ", $caPersonId, $entry.MainRecord.Organization.TranscoCode, $entry.MainRecord.Title.DisplayName, $entry.MainRecord.Email," ",$entry.MainRecord.Manager.MainRecord.LastName, $entry.MainRecord.Manager.MainRecord.FirstName, $caParameter)
                $writer.WriteLine('{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11};{12}', $values)

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