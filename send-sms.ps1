Param([bool]$result)

#set this up like you would Thunderbird
$smtp = "smtp.youraddress.com"
$smtpPort = "587"

#to set this up find your phone providers email to sms service
$to = "yournumber@yourprovider.com"

#email credentials
$from = "your-email@address.com" 
$access = "yourpassword"

#MESSAGES YOU'll RECEIVE AS SMS
$success = "RENDER FINISHED"
$failure = "RENDER CRASHED"

$Message = New-Object System.Net.Mail.MailMessage $from,$to

if ($result -eq $False) {$Message.Subject = $failure}
Else {$Message.Subject = $success}

# Construct the SMTP client object, credentials, and send
$Smtp = New-Object Net.Mail.SmtpClient($smtp,$smtpPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($from,$access)
$Smtp.Send($Message)