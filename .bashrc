source /etc/profile

#Wciagamy kolory, pod warunkiem ze zostały poprawnie zainstalowane.
source /etc/colors.sh


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Wersja Basha
echo -e "$Purple#Bash spasz-ubuntu-universal v.0.2.$Color_Off"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Wciagamy zmienne systemowe
source /home/$USER/variables.sh

#zmienne 
export MOUNTSSD="/mnt/linux"
export bashrc="/home/$USER/.bashrc"
export gdrive="/home/$USER/Dokumenty/folkus@gmail.com/"
export linux="/home/$USER/Dokumenty/folkus@gmail.com/Linux"
export hasla="$gdrive/Osobiste/hasla.cpt"
export sne="$gdrive/SNE"
export gentoo="$MOUNTSSD/gentoo"
export embedded="$MOUNTSSD/embedded-linux"
export bitbake="$embedded/setup-scripts"
export metasonel="$embedded/setup-scripts/sources/meta-sonel"
export metagrinn="$embedded/setup-scripts/sources/meta-grinn"
export deploy="$embedded/setup-scripts/deploy/glibc/images/mmr"
export kernel="$embedded/setup-scripts"
export sdcards="$embedded/sdcards"
export sysroot="$sdcards/sysroot"
export ubuntupackages="/home/$USER/Dokumenty/folkus@gmail.com/Linux/ubuntu-packages"
export baseimage="/home/$USER/Dokumenty/folkus@gmail.com/Linux/base-image.sh"
export www="/var/www/html" 
export kiry="/home/spasz/Dokumenty/folkus@gmail.com/Wyjazdy/kiry"
export scripts="/home/$USER/scripts"
export boisko="/home/$USER/Dokumenty/boisko"
export git="/home/$USER/Dokumenty/git"

#nadpisane polecenia
alias cp='cp -rfv'
alias rm='rm -rfv'
alias mv='mv -fv'
#Aliasy
alias testInternet="/usr/bin/wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias gvi="gvim --remote-tab"
alias serial_MI0="sudo miniterm.py -b 115200 -p /dev/ttyMI0"

alias PulpitSonel="rdesktop $SWIDNICAIP -u spaszko -p $SONELPASS -g \"$DESKTOPWIDTH\"x\"$DESKTOPHEIGHT\" -r clipboard:CLIPBOARD -r disk:Spaszko=\home\spasz\ "
alias PulpitWroclaw="rdesktop $WROCLAWIP -u spasz -p $SONELPASS -g \"$DESKTOPWIDTH\"x\"$DESKTOPHEIGHT\" -r clipboard:CLIPBOARD -r disk:Spaszko=\home\spasz\ "
alias sshSonel="ssh -X spaszko@$MYSONELIP" 

# Poprawka do prompt'a systemowego
export SYSTEMVER=`lsb_release -a | grep Rele | grep ".[0-9]\..*" -o`
export SYSTEM=`lsb_release -a | grep Rele | grep ".[0-9]\..*" -o`
export TODAY=`date +"%d.%m.%Y"`

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  export PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  export PS1="[\\u@\\D{%d.%m.%Y} \\W] $ "
fi

