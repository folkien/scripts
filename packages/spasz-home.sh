#Ubuntu 14.04 dom - Toshiba Satellite A200
source spaszko-base.sh

# Pakiety do pythona
sudo pip install XlsxWriter
sudo pip install django

# Aplikujemy Poprawki do ubuntu
#--------------------------------------------------------------------------------

sh ssd_trim_patch.sh

#ustawiamy tapete
axel http://swiezepieczywko.cba.pl/wp-content/uploads/2014/04/ziomor_lot1.jpg
cp ziomor_lot1.jpg ~/Dokumenty/
gsettings set org.gnome.desktop.background picture-uri file:///home/spasz/Dokumenty/ziomorr_lot1.jpg

# Synchronizujemy ustawienia
# --------------------------------------------------------------------------------
source spaszko-synchro-vim.sh
source spaszko-synchro-conky.sh
sudo apt-add-repository ppa:sunab/kdenlive-release

#Filmy i kodeki
sudo apt-get update
sudo apt-get install kdenlive -yf
