# Basic file with functions to show diffrent messages on terminal.
source /etc/colors.sh

# --------------------------------------------------------------------------------
minfo()
{
    echo -e "${Cyan}$@${Color_Off}"
}

mwarning()
{
    echo -e "${Yellow}$@${Color_Off}"
}

merror()
{
    echo -e "${Red}$@${Color_Off}"
}


msuccess()
{
    echo -e "${Green}$@${Color_Off}"
}
# --------------------------------------------------------------------------------


# kernel messages to kdev
# --------------------------------------------------------------------------------
kinfo()
{
    echo -e "${Cyan}$@${Color_Off}"
}

kwarning()
{
    echo -e "${Yellow}$@${Color_Off}"
}

kerror()
{
    echo -e "${Red}$@${Color_Off}"
}


ksuccess()
{
    echo -e "${Green}$@${Color_Off}"
}
# --------------------------------------------------------------------------------
