# instalacja skryptów w systemie
#
# @param Argument - all - wszystko
#
#
source ./install.sh


# Packages
# -------------------------------------
if [ $# -gt 0 ] && [ $Argument = "all" ]; then
    #Package manager determining
    lsb_release -i | grep Ubuntu
    if [ $? -eq 0 ]; then
        PKG_MANAGER="sudo apt-get install -yf "
        PKG_REMOVE="sudo apt-get remove -yf"
    fi
    lsb_release -i | grep Manjaro
    if [ $? -eq 0 ]; then
        PKG_MANAGER="sudo pacman -S "
    fi
    lsb_release -i | grep Arch
    if [ $? -eq 0 ]; then
        PKG_MANAGER="sudo pacman -S "
    fi

    cd $DIR
    echo "Packages installation..."

    # Dependencies install
    $PKG_MANAGER lsb-core
    $PKG_MANAGER `check-language-support -l pl`
    $PKG_MANAGER pv dialog ncdu pydf lynx
    $PKG_MANAGER yakuake
    $PKG_MANAGER convert
    $PKG_MANAGER git gitg qgit git-svn git-email
    $PKG_MANAGER rar unrar
    $PKG_MANAGER p7zip-full
    $PKG_MANAGER meld kdiff3
    $PKG_MANAGER bless
    $PKG_MANAGER wxhexeditor
    $PKG_MANAGER make
    $PKG_MANAGER cmake
    $PKG_MANAGER ncurses libncurses-dev
    $PKG_MANAGER libncurses5-dev libncursesw5-dev
    ./packages/ubuntu-packages/cmake.sh

    #Narzędzia dyskowe i plikowe
    $PKG_MANAGER gparted
    $PKG_MANAGER baobab
    sudo ln -sf /usr/bin/baobab /usr/bin/filelight
    $PKG_MANAGER rar unrar
    $PKG_MANAGER p7zip-full
    $PKG_MANAGER pdftk
    $PKG_MANAGER autojump
    $PKG_MANAGER exfat-fuse exfat-utils
    ./packages/ubuntu-packages/fatcat.sh

    #Narzędzia systemowe
    $PKG_MANAGER tuptime
    $PKG_MANAGER mc
    $PKG_MANAGER dos2unix
    $PKG_MANAGER procinfo
    $PKG_MANAGER finger
    $PKG_MANAGER tree
    $PKG_MANAGER curl
    $PKG_MANAGER htop
    $PKG_MANAGER iotop
    $PKG_MANAGER fonts-inconsolata ttf-mscorefonts-installer
    $PKG_MANAGER exuberant-ctags
    $PKG_MANAGER beep
    $PKG_MANAGER synaptic
    $PKG_MANAGER libnotify-bin
    $PKG_MANAGER rename
    $PKG_MANAGER python3-pip
    sudo snap install powerstat
    ./packages/ubuntu-packages/udev.sh
    ./packages/ubuntu-packages/xidel.sh
    ./packages/ubuntu-packages/sysdig.sh

    # Programowanie, Debugowanie i praca
    $PKG_MANAGER openocd
    $PKG_MANAGER colordiff
    $PKG_MANAGER cppcheck
    $PKG_MANAGER clang-format
    $PKG_MANAGER clang-tidy
    $PKG_MANAGER clang-tools
    ./packages/ubuntu-packages/diff-so-fancy.sh
    ./packages/ubuntu-packages/firacode.sh
    ./packages/ubuntu-packages/pyocd.sh
    ./packages/ubuntu-packages/markdown.sh

    # Python packages
    pip3 install pre-commit
    pip3 install blockdiag
    pip3 install cpplint
    pip3 install autopep8
    pip3 install flake8
    pip3 install s-tui --user


    #Szyfrowanie
    ./packages/ubuntu-packages/encfs.sh

    #edytory
    $PKG_MANAGER vim-gtk
    ./packages/ubuntu-packages/typora.sh

    #Narzędzia sieciowe
    $PKG_MANAGER iperf
    $PKG_MANAGER net-tools
    $PKG_MANAGER nmap
    $PKG_MANAGER wireshark
    $PKG_MANAGER mingetty minicom cutecom
    $PKG_MANAGER openvpn
    $PKG_MANAGER traceroute
    $PKG_MANAGER sshpass
    $PKG_MANAGER mutt
    $PKG_MANAGER wkhtmltopdf
    # Zdalny dostep
    ./packages/ubuntu-packages/ssh-server.sh
    ./packages/ubuntu-packages/xrdp.sh

    #Grafika
    $PKG_MANAGER imagemagick
    $PKG_MANAGER libopencv-dev
    $PKG_MANAGER zbar-tools
    ./packages/ubuntu-packages/nvidia-purge.sh
    ./packages/ubuntu-packages/nvidia.sh
    ./packages/ubuntu-packages/nvidia-cuda.sh
    ./packages/ubuntu-packages/nvtop.sh

    #Muzyka
    $PKG_MANAGER ffmpeg
    $PKG_MANAGER alsa-tools-gui
    $PKG_MANAGER pavucontrol
    ./packages/ubuntu-packages/radiotray.sh

    # Filmy
    ./packages/ubuntu-packages/dvdcodedcs.sh
    $PKG_MANAGER linux-firmware-nonfree
    $PKG_MANAGER v4l-utils
    $PKG_MANAGER streamer

    cd $DIR
    # VIM bundles install if not exists
    if [ ! -e ~/.vimrc.bundles ]; then
	    sh ./install-vim.sh
    else
	    echo "VIM bundles installed before."
    fi

    #Installation of mc
    if [ ! -L ~/.config/mc/hotlist ]; then
	    echo "MC configuration files."
	    cp -rfv ~/.config/mc ~/.config/mc.old
	    ln -sf $DIR/.config/mc/hotlist ~/.config/mc/hotlist
	    ln -sf $DIR/.config/mc/hotlist.bak ~/.config/mc/hotlist.bak
	    ln -sf $DIR/.config/mc/mc.ext ~/.config/mc/mc.ext
	    ln -sf $DIR/.config/mc/mc.keymap ~/.config/mc/mc.keymap
	    ln -sf $DIR/.config/mc/panels.ini ~/.config/mc/panels.ini
	    ln -sf $DIR/.config/mc/ini ~/.config/mc/ini
    else
	    echo "MC configuration installed before."
    fi

    # Clean and upgrade
    echo -ne "\n\nUpgrade and Clean packages?"
    sudo apt upgrade
    sudo apt autoremove
fi
