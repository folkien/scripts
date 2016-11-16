#Ubuntu 14.04 - spaszko, to co jest wspolne dla wszystkich moich komputerów.

source base-image.sh

# Systemowe
#--------------------------------------------------------------------------------
./ubuntu-packages/sysdig.sh

# Edytory tekstowe
#--------------------------------------------------------------------------------

# Internet
#--------------------------------------------------------------------------------
#TODO ./ubuntu-packages/dropbox.sh

# Grafika i obrazy
#--------------------------------------------------------------------------------

# Naukowe i inżynierskie
#--------------------------------------------------------------------------------
sudo apt-get install -yf gnuplot octave

#moje pakiety dodatkowe
#--------------------------------------------------------------------------------
sh ./ubuntu-packages/flux.sh
sh ./ubuntu-packages/encfs.sh


