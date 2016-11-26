#!/bin/bash
# Skrypt należy wykonywać jako root.

export HOME_FOLDER=$HOME

#tworzymy drzewo katalogów instalacyjnych  w którym będziemy pracować
mkdir install
mkdir install/synchronize-settings
#cd ./install


#potrzebujemy git'a
#sudo apt-add-repository -y ppa:git-core/ppa
#sudo apt-get update
sudo apt-get -f -y install git
sudo apt-get -f -y install git-email git-svn


# Dodawanie nowych repozytoriow
# --------------------------------------------------------------------------------
sh ./ubuntu-packages/getdeb-repo.sh
sudo add-apt-repository -y  ppa:danielrichter2007/grub-customizer
#sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" 
#sudo add-apt-repository -y ppa:gnome-terminator
#sudo add-apt-repository -y ppa:ubuntu-wine/ppa
#sudo apt-add-repository -y ppa:shutter/ppa
#sudo apt-add-repository -y ppa:team-xbmc/ppa
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

#Refresh wszystkiego 
sudo apt-get -y -f update
# bez upgradesudo apt-get -y -f upgrade

# Instalacja menadżerem pakietów
# -------------------------------------------------------------------------------- 

#support językowy
sudo apt-get -y -f install `check-language-support -l pl`

#najpierw drivery do karty graficznej bo to jest masakra ze tego nie ma
#--------------------------------------------------------------------------------
#sudo apt-get -y -f install nvidia-304
#depmod -a
#sudo nvidia-xconfig

#instalacja menadzerem pakietow
#--------------------------------------------------------------------------------
#sudo apt-get -y -f install linux-generic
#sudo apt-get -y -f install linux-headers-$(uname -r)
#sudo apt-get -y -f install xauth

#in /etc/ssh/sshd_config on the server, X11Forwarding is set to yes
#in /etc/ssh/ssh_config on the client, ForwardX11 is set to yes. Add the line if needed.

# Usuwanie niepotrzebnych
#--------------------------------------------------------------------------------
sudo apt-get -y -f remove thunderbird
sudo apt-get -y -f remove totem
sudo apt-get -y -f remove rhythmbox

# Narzędzia systemowe
#--------------------------------------------------------------------------------
sudo apt-get -y -f install rar unrar
sudo apt-get -y -f install grub-customizer
sudo apt-get -y -f install p7zip-full
sudo apt-get -y -f install mc curl
sudo apt-get -y -f install terminator yakuake
sudo apt-get -y -f install finger
sudo apt-get -y -f install gparted
sudo apt-get -y -f install gitg meld
sudo apt-get -y -f install doxygen graphviz
sudo apt-get -y -f install tree
sudo apt-get -y -f install synaptic
sudo apt-get install -yf curlftpfs 
sudo apt-get install -yf cifs-utils
sudo apt-get install -yf links htop 
sudo apt-get install -yf jobs-admin
sudo apt-get install -yf ubuntu-tweak

# Edytory tekstowe
#--------------------------------------------------------------------------------
sudo apt-get -y -f install vim-gnome 

# Dźwięk
#--------------------------------------------------------------------------------
sudo apt-get -y -f install audacity
sudo apt-get -y -f install audacious
sudo apt-get -y -f install spotify-client

# Internet
#--------------------------------------------------------------------------------
sudo apt-get -y -f install wireshark
sudo apt-get -y -f install filezilla
#sudo apt-get -y -f install google-chrome-stable
sudo apt-get install -yf rdesktop
sh ./ubuntu-packages/axel-downloader.sh
#sh ./ubuntu-packages/maxthon-1.0.5.3.sh
#sh ./ubuntu-packages/install-flashplayer.sh

# Grafika i obrazy
#--------------------------------------------------------------------------------
sudo apt-get -y -f install imagemagick
sudo apt-get -y -f install shutter
sudo apt-get -y -f install gimp
#sudo apt-get -y -f install inkscape

# Filmy i kodeki
#--------------------------------------------------------------------------------
#sudo apt-get -y -f install mplayer
#sudo apt-get -y -f install xbmc
sudo apt-get -y -f install vlc browser-plugin-vlc

# Pozostałe
#--------------------------------------------------------------------------------
#sudo apt-get -y -f install xpad
#sudo apt-get -y -f install xfburn
sudo apt-get install -yf gnome-schedule

#google keep 
#http://ubuntuhandbook.org/index.php/2014/04/install-google-keep-in-ubuntu-14-04-trusty/

#update do sterownikow na podstawie https://sites.google.com/site/easylinuxtipsproject/first
#howto dla dyskow SSD https://sites.google.com/site/easylinuxtipsproject/ssd
#https://sites.google.com/site/easylinuxtipsproject/speed
sudo apt-get install linux-firmware-nonfree

# Aplikujemy Poprawki do ubuntu
#--------------------------------------------------------------------------------

#poprawka do swap'u wykorzystania 
sudo sh ./ubuntu-packages/swappiness-chg.sh

#pozbycie sie reklam
#-------------------------------------------------------------------------------
#wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash
#-------------------------------------------------------------------------------
    
#Wyłaczam autouruchamianie pendrive'a
#gsettings set org.gnome.desktop.media-handling automount-open false

#Wlaczanie 4 pulpitów
#http://askubuntu.com/questions/459284/how-to-use-different-workspaces-on-ubuntu-14-04
sudo apt-get install -yf  fonts-inconsolata exuberant-ctags yad \
                          cscope mingetty beep -yf pv minicom cutecom dconf-editor iperf gpick ttf-mscorefonts-installer iotop \
                          ecryptfs-utils

sh ./ubuntu-packages/ssd_trim_patch.sh

echo "Zakończono instalacje."
