$Password = ConvertTo-SecureString "bGtwh1BmqpqnDi" -AsPlainText -Force
$Login = "ca-pacificadev.fr\CS_DEV_EXG"

$SessionOpt = New-PSSessionOption -SkipCACheck:$true -SkipCNCheck:$true -SkipRevocationCheck:$true
$credential = New-Object System.Management.Automation.PSCredential($Login,$Password)
$session = New-PSSession -ConnectionUri "https://10.110.117.248:5986/PowerShell/" -Credential $credential -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection -SessionOption $SessionOpt

Import-PSSession $session -DisableNameChecking