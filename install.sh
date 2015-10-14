#instalacja skryptów w systemie
DIR=`pwd`
cd /usr/bin/
ln -sf $DIR/pushf.sh pushf
ln -sf $DIR/popf.sh popf
ln -sf $DIR/cps.sh cps
ln -sf $DIR/git-create-repository.sh git-create-repository
ln -sf $DIR/tars.sh tars
ln -sf $DIR/trim.py trim
ln -sf $DIR/after.py after
ln -sf $DIR/volumeup.sh volumeup
ln -sf $DIR/volumedown.sh volumedown
ln -sf $DIR/ysess.py ysess
ln -sf $DIR/burnimage burnimage
ln -sf $DIR/grep-email.sh  grep-email
ln -sf $DIR/arm-chroot.sh arm-chroot
ln -sf $DIR/chroot.sh mount-chroot

#Instalacja konfiguracji XFCE4
rm -rf ~/.config/xfce4
ln -sf $DIR/config/xfce4/ ~/.config/xfce4
 
cd $DIR
cp -rfv colors.sh /etc/
# test czy posiadamy xdotool
xdotool help
if [ $? -eq 127 ] ; then
    sudo apt-get install xdotool
else
    echo "Posiadasz xdotool."
fi
