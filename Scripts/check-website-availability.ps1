#
# This script is meant to wait during at most 1min for the Usercube Server to be properly started
#

$startDate = Get-Date
do {
    try {
        $response = Invoke-WebRequest "http://localhost:5000/hc" -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            $endDate = Get-Date
            $duration = New-TimeSpan -Start $startDate -End $endDate
            Write-Host "Site is now available, it was unavailable for $duration"
            exit
        }
    }
    catch {
        Write-Host "Site not available, checking again shortly"
    }
    
    Start-Sleep -seconds 5
} while ($startDate.AddMinutes(1) -gt (Get-Date))

Write-Error "Site is still unavailable after 1min. Timeout aborting..."
exit 1