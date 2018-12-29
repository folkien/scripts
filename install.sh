# instalacja skryptów w systemie
#
# @param Argument - all - wszystko
#
#
DIR=`pwd`
repositoryUrl="git@github.com:folkien/scripts.git"
Argument=$@

source $DIR/.bashrc.variables

# Root install prevention
# -------------------------------------
if [[ $EUID -eq 0 ]]; then
   echo "Don't run this as root."
   exit 1
fi

# Tworzenie najważniejszych katalogów
# -------------------------------------
sudo install -d -o $USER -g $USER $git $www $gdrive $boisko $software
sudo chown -R $USER.$USER $software

# Generation of .ssh keys
if [ ! -e ~/.ssh/id_rsa.pub ]; then
	echo "Generating new ssh key. Please install it in github.com"
	ssh-keygen
	sudo touch /etc/sshkeysgenerated
	echo "Please install git certificate .ssh or add your own to github. Waiting."
	read
fi

# Check location of scripts repository
# -------------------------------------
pwd | grep $git
if [ $? -ne 0 ]; then
	echo "Scripts installation from another location."
	cd $git
	git clone $repositoryUrl
	cd scripts
	./install.sh $@
	exit 0
fi

# BASH
# -------------------------------------
./install-bashrc.sh


# Python programs
# -------------------------------------
if [ ! -d $python ]; then
    sudo install -d -o $USER -g $USER $python
fi
cd $python
if [ ! -e $python/pyNotify ]; then
    git clone git@github.com:folkien/pyNotify.git
    sh $python/pyNotify/install.sh
fi
if [ ! -e $python/pypass ]; then
    git clone git@github.com:folkien/pypass.git
    sh $python/pypass/install.sh
fi

# Scripts 
# -------------------------------------
echo "Scripts installation..."
cd /etc/
sudo ln -sf $DIR/colors.sh      colors.sh
sudo ln -sf $DIR/messages.sh    messages.sh

cd /usr/bin/
sudo ln -sf $DIR/pushf.sh pushf
sudo ln -sf $DIR/popf.sh popf
sudo ln -sf $DIR/cps.sh cps
sudo ln -sf $DIR/git-create-repository.sh git-create-repository
sudo ln -sf $DIR/tars.sh tars
sudo ln -sf $DIR/trim.py trim
sudo ln -sf $DIR/after.py after
sudo ln -sf $DIR/volumeup.sh volumeup
sudo ln -sf $DIR/volumedown.sh volumedown
sudo ln -sf $DIR/ysess.py ysess
sudo ln -sf $DIR/burnimage burnimage
sudo ln -sf $DIR/grep-email.sh  grep-email
sudo ln -sf $DIR/arm-chroot.sh arm-chroot
sudo ln -sf $DIR/arm-make.sh arm-make
sudo ln -sf $DIR/chroot.sh mount-chroot
sudo ln -sf $DIR/append.sh append
sudo ln -sf $DIR/filesize.sh filesize
sudo ln -sf $DIR/focus_or_launch.sh focus_or_launch
sudo ln -sf $DIR/zdjecia-na-strone.sh zdjecia-na-strone
sudo ln -sf $DIR/image-resize.sh image-resize
sudo ln -sf $DIR/decompile-dtb.sh decompile-dtb
sudo ln -sf $DIR/ddpv ddpv
sudo ln -sf $DIR/udevquery.sh udevquery
sudo ln -sf $DIR/sed-on-directory.sh sed-on-directory
sudo ln -sf $DIR/stash2patch.sh stash2patch
sudo ln -sf $DIR/patch2stash.sh patch2stash
sudo ln -sf $DIR/ssh-exchange-keys.sh ssh-exchange-keys
sudo ln -sf $DIR/buildkernel.sh buildkernel
sudo ln -sf $DIR/hex2ascii.sh hex2asci
sudo ln -sf $DIR/hex2dec.sh hex2dec
sudo ln -sf $DIR/gccMapAnalyzer.py gccMapAnalyzer
sudo ln -sf $DIR/ascii2hex.sh ascii2hex
sudo ln -sf $DIR/filelist.sh filelist
sudo ln -sf $DIR/kernelCopy2Disk.sh kernelCopy2Disk
sudo ln -sf $DIR/kernelUnpack2Disk.sh kernelUnpack2Disk
sudo ln -sf $DIR/ubootCopy2Disk.sh ubootCopy2Disk
sudo ln -sf $DIR/PopeHomilia.sh PopeHomilia
sudo ln -sf $DIR/map2html.py map2html
sudo ln -sf $DIR/mp4tomp3.sh mp4tomp3
sudo ln -sf $DIR/bssAnalyze.py bssAnalyze
sudo ln -sf $DIR/cmd.sh cmd
sudo ln -sf $DIR/convertIncludeBackslashesToSlashes.sh convertIncludeBackslashesToSlashes
sudo ln -sf $DIR/prependTextBeforeClassMethod.sh prependTextBeforeClassMethod
sudo ln -sf $DIR/swap-clean.sh swap-clean
sudo ln -sf $DIR/git-edit.sh git-edit
sudo ln -sf $DIR/jlink-show.sh jlink-show
sudo ln -sf $DIR/file-newest.sh file-newest
sudo ln -sf $DIR/file-oldest.sh file-oldest
sudo ln -sf $DIR/image-directory-rename.sh image-directory-rename

# git modifications
# -------------------------------------
git config --global alias.today 'log --since=1am'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.graph "log --graph --all --decorate"
#git config --global alias.change-commits = "!f() { VAR=$1; OLD=$2; NEW=$3; shift 3; git filter-branch --env-filter \"if [[ \\\"$`echo $VAR`\\\" = '$OLD' ]]; then export $VAR='$NEW'; fi\" $@; }; f "
git config --global merge.tool kdiff3
git config --global diff.tool meld
git config --global user.name "Sławomir Paszko"
git config --global user.email "folkus@gmail.com"

# Settings 
# -------------------------------------
gsettings set org.gnome.meld detect-encodings "['UTF-8', 'WINDOWS-1252', 'ISO-8859-15', 'UTF-16', 'WINDOWS-1253', 'KOI8-R']"

# Packages
# -------------------------------------
if [ $# -gt 0 ] && [ $Argument = "all" ]; then
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

    cd $DIR
    echo "Packages installation..."

    # Dependencies install
    $PKG_MANAGER lsb-core
    $PKG_MANAGER `check-language-support -l pl`    
    $PKG_MANAGER pv dialog ncdu pydf lynx
    $PKG_MANAGER device-tree-compiler
    $PKG_MANAGER yakuake
    $PKG_MANAGER convert
    $PKG_MANAGER git gitg qgit git-svn git-email 
    $PKG_MANAGER rar unrar 
    $PKG_MANAGER p7zip-full
    $PKG_MANAGER meld kdiff3
    $PKG_MANAGER make
    $PKG_MANAGER ncurses libncurses-dev
#    $PKG_MANAGER gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi
    
    $PKG_MANAGER u-boot-tools

    #Narzędzia dyskowe
    $PKG_MANAGER gparted
    $PKG_MANAGER baobab

    #Narzędzia systemowe
    $PKG_MANAGER tuptime
    $PKG_MANAGER procinfo
    $PKG_MANAGER finger
    $PKG_MANAGER tree
    $PKG_MANAGER curl
    $PKG_MANAGER htop
    $PKG_MANAGER iotop
    $PKG_MANAGER fonts-inconsolata ttf-mscorefonts-installer
    $PKG_MANAGER exuberant-ctags
    $PKG_MANAGER beep
    $PKG_MANAGER gnome-schedule

    #Narzędzia sieciowe
    $PKG_MANAGER iperf
    $PKG_MANAGER wireshark
    $PKG_MANAGER filezilla
    $PKG_MANAGER rdesktop
    $PKG_MANAGER mingetty minicom cutecom 

    #Grafika
    $PKG_MANAGER imagemagick
    $PKG_MANAGER shutter
    $PKG_MANAGER gimp
    
    # Filmy
    $PKG_MANAGER vlc
    $PKG_MANAGER browser-plugin-vlc
    $PKG_MANAGER linux-firmware-nonfree

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
fi
