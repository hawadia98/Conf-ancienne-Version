#Construction des parametres du call API GET Orga

$apiPath = '/api/Resource/Directory_Organization?api-version=1.0'
$path = '/Custom/Resources/Directory_Organization/View&QueryRootEntityType=Directory_Organization'
$url = 'https://dev-fusion-iam.caa.group.gca'
$squery = 'join Parent p join Company c join c.Type ct join Manager m join m.MainRecord mr select TranscoCode, c.DisplayName, p.TranscoCode, DisplayName, mr.FirstName, mr.LastName, ct.DisplayName where (p.FullName !=% " " and ct.DisplayName != "CDS") order by Id asc'
$continuationToken = ''
$pageSize = 10000
$timestamp = Get-Date -Format "MM-dd-yyyy"
$outputFile = "D:\UsercubeCAA\Sources\RCI\Export\Export_RCI_Orga_$timestamp.csv"

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

$headers = @('Ou', 'O', 'CaUnitDN', 'Cn', 'caManagementIndication')

$writer.WriteLine('{0};{1};{2};{3};{4}', $headers)

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

                
                $Responsable = "Responsable$"+$entry.Manager.MainRecord.LastName+"$"+$entry.Manager.MainRecord.FirstName+"$"+"1"
                $values = @($entry.TranscoCode, $entry.Company.DisplayName, $entry.Parent.TranscoCode, $entry.DisplayName, $Responsable)
                Write-Host $values
                $writer.WriteLine('{0};{1};{2};{3};{4}', $values)

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