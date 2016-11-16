#axel http://epierce.freeshell.org/gimp/ps-menurc
#cp ps-menurc ~/.gimp-2.8/menurc

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt-get update
sudo apt-get install gimp gimp-plugin-registry -yf

axel http://fc08.deviantart.net/fs71/f/2014/044/9/9/gimp_2_8_photoshop_tweaks_by_doctormo-d75n1qc.zip
unzip gimp_2_8_photoshop_tweaks_by_doctormo-d75n1qc.zip -d ~/
