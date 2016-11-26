sudo apt-get install heirloom-mailx elinks -yf
sudo apt-get install libnss3-tools -yf

# Go to home directory
cd 

# Create a certificate directory
mkdir .certs

# Create a new database in the certs dir
certutil -N -d .certs 

# Fetch the certificate from Gmail, saving in the text file GMAILCERT
echo -n | openssl s_client -connect smtp.gmail.com:465 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > GMAILCERT

# Import the new cert file into the new database in the new dir
certutil -A -n "Google Internet Authority" -t "C,," -d .certs -i GMAILCERT 

# Double Check
certutil -L -d .certs


echo " 		
account gmail {
set smtp-use-starttls
set smtp=smtp://smtp.gmail.com:587
set smtp-auth=login
set smtp-auth-user=abcd@gmail.com
set smtp-auth-password=mypassword
set from="ABCD "
}										\
 " > .mailrc

#Testing mail Config
#echo "Test Email" | mailx  -v -A gmail -s "test" zubair.ahmed@me.com
