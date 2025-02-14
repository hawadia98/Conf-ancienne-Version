$timestamp = Get-Date -Format "MM-dd-yyyy"
$from = "usercube@ca-assurances.fr"

$to = "usercube1@ca-assurances.fr"

$body = "Export RCI personnes et organisation"

$subject = "Export RCI personnes et organisation"

$message = New-Object System.Net.Mail.MailMessage
$message.From = New-Object System.Net.Mail.MailAddress $from

$to | ForEach-Object { $message.To.Add($_) }

$message.Subject = $subject
$message.Body = $body

$deliveryMethod = [System.Net.Mail.SmtpDeliveryMethod]::SpecifiedPickupDirectory

$smtpClient = New-Object System.Net.Mail.SmtpClient
$smtpClient.DeliveryMethod = $deliveryMethod

$pickupDirectory = "D:\UsercubeCAA\Mails"
$smtpClient.PickupDirectoryLocation = $pickupDirectory
$OrgaCSV = "D:\UsercubeCAA\Sources\RCI\Export\Export_RCI_Orga_$timestamp.csv"
$PersonCSV = "D:\UsercubeCAA\Sources\RCI\Export\Export_RCI_Person_$timestamp.csv"
$attachmentOrga = New-Object System.Net.Mail.Attachment($OrgaCSV)
$attachmentPerson = New-Object System.Net.Mail.Attachment($PersonCSV)
$message.Attachments.Add($attachmentOrga)
$message.Attachments.Add($attachmentPerson)

$smtpClient.Send($message)