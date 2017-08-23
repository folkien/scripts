#instalacja skryptów w systemie
DIR=`pwd`

if [ $# -ne 0 ]; then
    if [ $@ = "scripts" ]; then
        NODEPENDENCIES=1
    fi
else
    NODEPENDENCIES=1
fi

echo "Scripts installation..."
ln -sf $DIR/colors.sh      /etc/colors.sh
ln -sf $DIR/messages.sh    /etc/messages.sh

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
ln -sf $DIR/arm-make.sh arm-make
ln -sf $DIR/chroot.sh mount-chroot
ln -sf $DIR/append.sh append
ln -sf $DIR/filesize.sh filesize
ln -sf $DIR/focus_or_launch.sh focus_or_launch
ln -sf $DIR/zdjecia-na-strone.sh zdjecia-na-strone
ln -sf $DIR/image-resize.sh image-resize
ln -sf $DIR/decompile-dtb.sh decompile-dtb
ln -sf $DIR/ddpv ddpv
ln -sf $DIR/udevquery.sh udevquery
ln -sf $DIR/grepsed.sh grepsed
ln -sf $DIR/stash2patch.sh stash2patch
ln -sf $DIR/patch2stash.sh patch2stash
ln -sf $DIR/ssh-exchange-keys.sh ssh-exchange-keys
ln -sf $DIR/buildkernel.sh buildkernel
ln -sf $DIR/hex2ascii.sh hex2asci
ln -sf $DIR/hex2dec.sh hex2dec
ln -sf $DIR/gccMapAnalyzer.py gccMapAnalyzer
ln -sf $DIR/ascii2hex.sh ascii2hex
ln -sf $DIR/filelist.sh filelist
ln -sf $DIR/kernelCopy2Disk.sh kernelCopy2Disk
ln -sf $DIR/kernelUnpack2Disk.sh kernelUnpack2Disk
ln -sf $DIR/ubootCopy2Disk.sh ubootCopy2Disk
ln -sf $DIR/PopeHomilia.sh PopeHomilia
ln -sf $DIR/map2html.py map2html
ln -sf $DIR/mp4tomp3.sh mp4tomp3
ln -sf $DIR/bssAnalyze.py bssAnalyze

if [ $NODEPENDENCIES -ne 1 ]; then
    echo "Dependencies installation..."
    #Package manager determining
    lsb_release -i | grep Ubuntu
    if [ $? -eq 0 ]; then
        PKG_MANAGER="apt-get install -yf "
    fi
    lsb_release -i | grep Manjaro
    if [ $? -eq 0 ]; then
        PKG_MANAGER="pacman -S "
    fi
    lsb_release -i | grep Arch
    if [ $? -eq 0 ]; then
        PKG_MANAGER="pacman -S "
    fi
    # Dependencies install
    $PKG_MANAGER pv dialog ncdu pydf lynx
    $PKG_MANAGER device-tree-compiler
    $PKG_MANAGER yakuake
    $PKG_MANAGER convert
    $PKG_MANAGER git gitg qgit git-svn 
    $PKG_MANAGER make
    $PKG_MANAGER ncurses libncurses-dev
    $PKG_MANAGER gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi
    $PKG_MANAGER u-boot-tools

    echo "Generating new ssh key. Please install it in github.com"
    ssh-keygen
    echo "Please install git certificate .ssh or add your own to github. Waiting."
    read

    cd $DIR
    sh ./install-vim.sh

    #Installation of mc
    echo "MC configuration files."
    cp -rfv ~/.config/mc ~/.config/mc.old
    ln -sf $DIR/.config/mc/hotlist ~/.config/mc/hotlist
    ln -sf $DIR/.config/mc/hotlist.bak ~/.config/mc/hotlist.bak
    ln -sf $DIR/.config/mc/mc.ext ~/.config/mc/mc.ext
    ln -sf $DIR/.config/mc/mc.keymap ~/.config/mc/mc.keymap
    ln -sf $DIR/.config/mc/panels.ini ~/.config/mc/panels.ini
    ln -sf $DIR/.config/mc/ini ~/.config/mc/ini

    # Tworzenie najważniejszych katalogów
    source $DIR/.bashrc.variables
    mkdir -p $git $www $gdrive $boisko $software
    chown -R $USER.$USER $software
fi
