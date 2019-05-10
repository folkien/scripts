# Sysdig - program do analizy systemu. S.Paszko
# Przed instalacja nalezy sprawdzic czy lista repozytoriow w systemie jest 
# poprawna ( czy działa apt-get update i nie zwraca bledow).
curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash

sudo apt-get -yf install sysdig
