# Create new certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365
openssl pkcs12 -export -out cert.pfx -inkey key.pem -in cert.pem
