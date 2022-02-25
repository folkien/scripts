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

    $PKG_MANAGER clang-tools
    $PKG_MANAGER qemu-user-static
    $PKG_MANAGER sqlitebrowser
    ./packages/ubuntu-packages/diff-so-fancy.sh
    ./packages/ubuntu-packages/arduino.sh
    ./packages/ubuntu-packages/firacode.sh
    ./packages/ubuntu-packages/bluepy.sh
    ./packages/ubuntu-packages/eclipse-oxygen.sh
    ./packages/ubuntu-packages/pyocd.sh
    ./packages/ubuntu-packages/mbed.sh
    ./packages/ubuntu-packages/octave.sh
    ./packages/ubuntu-packages/markdown.sh
    ./packages/ubuntu-packages/esptool.sh
    ./packages/ubuntu-packages/biosppy.sh
    ./packages/ubuntu-packages/supla.sh
    ./packages/ubuntu-packages/sonoff.sh
    ./packages/ubuntu-packages/QtProject.sh
    ./packages/ubuntu-packages/googletest.sh
    sudo snap install pycharm-community --classic

    # Biological
    $PKG_MANAGER pymca
    $PKG_MANAGER edfbrowser

    # Python packages
    pip3 install pre-commit
    pip3 install blockdiag
    pip3 install cpplint
    pip3 install autopep8
    pip3 install flake8
    pip3 install jupyterlab
    pip3 install csvkit
    pip3 install s-tui --user


    #Szyfrowanie
    ./packages/ubuntu-packages/encfs.sh

    #edytory
    $PKG_MANAGER vim-gtk
    ./packages/ubuntu-packages/typora.sh

    # gry
    ./packages/ubuntu-packages/nes.sh

    #Narzędzia sieciowe
    $PKG_MANAGER iperf
    $PKG_MANAGER net-tools
    $PKG_MANAGER nmap
    $PKG_MANAGER wireshark
    $PKG_MANAGER filezilla
    $PKG_MANAGER rdesktop
    $PKG_MANAGER mingetty minicom cutecom
    $PKG_MANAGER openvpn
    $PKG_MANAGER traceroute
    $PKG_MANAGER sshpass
    $PKG_MANAGER mutt
    $PKG_MANAGER wkhtmltopdf
    ./packages/ubuntu-packages/mail-server.sh
    ./packages/ubuntu-packages/ssh-server.sh

    #Grafika
    $PKG_MANAGER arandr
    $PKG_MANAGER imagemagick
    $PKG_MANAGER xsane
    $PKG_MANAGER gnuplot-qt
    $PKG_MANAGER kst
    $PKG_MANAGER v4l-utils
    $PKG_MANAGER guvcview
    $PKG_MANAGER libopencv-dev
    $PKG_MANAGER flameshot
    $PKG_MANAGER zbar-tools
    sudo snap install gimp
    ./packages/ubuntu-packages/shutter.sh
    ./packages/ubuntu-packages/flux.sh
    ./packages/ubuntu-packages/obs-studio.sh
    ./packages/ubuntu-packages/nvtop.sh

    # Książki
    $PKG_MANAGER calibre


    #Muzyka
    sudo snap install spotify
    $PKG_MANAGER audacious
    $PKG_MANAGER audacity
    $PKG_MANAGER ffmpeg
    $PKG_MANAGER alsa-tools-gui
    $PKG_MANAGER pavucontrol
    ./packages/ubuntu-packages/radiotray.sh

    # Filmy
    ./packages/ubuntu-packages/dvdcodedcs.sh
    $PKG_MANAGER linux-firmware-nonfree
    $PKG_MANAGER v4l-utils
    $PKG_MANAGER streamer

    # Komunikatory
    sudo snap install skype --classic
    ./packages/ubuntu-packages/caprine.sh
#    sudo snap install caprine
    ./packages/ubuntu-packages/kdeconnect-indicator.sh


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
