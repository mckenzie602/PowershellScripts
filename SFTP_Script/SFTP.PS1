#Establishing the SFTP Connection

#SFTP server details
$server = "192.168.138.128"
$port = 22
$Username = "john.scott"
$password = "Sp0cklit3123"

#Converts the password to a secure string. NewSSHSession won't allow plain text as an input.
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

#Session Credentials converted into object.I did this so I don't have to type it out twice
$SessionCred = (New-Object -TypeName PSCredential -ArgumentList $Username, $securePassword)

#Creates the SSH session
$session = New-SSHSession -ComputerName $server -port $port -Credential $SessionCred

#creeate SFTP session using the SSH session
$sftp = New-SFTPSession -ComputerName $server -Port $port -Credential $SessionCred