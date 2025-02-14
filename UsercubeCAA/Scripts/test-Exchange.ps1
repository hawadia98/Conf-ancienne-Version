# Paramètres
$SessionOpt = New-PSSessionOption -SkipCACheck:$true -SkipCNCheck:$true -SkipRevocationCheck:$true
$ExchangeServer = "WR034EXG01001V.ca-pacificadev.fr" # Remplacez par le nom ou l'adresse IP du serveur Exchange
$Uri = "WR034EXG01001V.ca-pacificadev.fr:5986"
$userName = "ca-pacificadev\CS_DEV_EXG"
$password = ConvertTo-SecureString -string "bGtwh1BmqpqnDi" -asPlainText -force
$Credential = New-Object System.Management.Automation.PSCredential($userName, $password)

# # Vérifier la connectivité réseau
# Write-Host "Test de connectivité réseau vers $ExchangeServer..."
# if (Test-Connection -ComputerName $ExchangeServer -Count 2 -Quiet) {
    # Write-Host "Connectivité réseau : OK" -ForegroundColor Green
# } else {
    # Write-Host "Erreur de connectivité réseau vers $ExchangeServer" -ForegroundColor Red
    # exit
# }

# Tester la connexion PowerShell distante
Write-Host "Tentative de connexion PowerShell distante au serveur Exchange..."
try {
	#$Session = New-PSSession -ComputerName "10.110.117.248" -UseSSL -Authentication Negotiate -Credential $Credential -SessionOption $SessionOpt
	#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://10.110.242.82:5986/PowerShell/" -AllowRedirection -Authentication Basic -Credential $Credential -SessionOption $SessionOpt
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://$Uri/PowerShell/" -Authentication Basic -Credential $Credential -SessionOption $SessionOpt -AllowRedirection
    Import-PSSession $Session -DisableNameChecking -ErrorAction Stop
    Write-Host "Connexion établie avec succès !" -ForegroundColor Green
} catch {
    Write-Host "Erreur lors de la tentative de connexion : $($_.Exception.Message)" -ForegroundColor Red
    exit
}

# Exemple de commande pour vérifier le serveur Exchange
Write-Host "Exécution d'une commande pour vérifier le serveur Exchange..."
try {
    Get-Mailbox | Select-Object DisplayName, PrimarySmtpAddress | Out-Host
} catch {
    Write-Host "Erreur lors de l'exécution de la commande Exchange : $($_.Exception.Message)" -ForegroundColor Red
}

# Fermer la session PowerShell distante
if ($Session) {
    Remove-PSSession $Session
    Write-Host "Session distante fermée." -ForegroundColor Yellow
}
