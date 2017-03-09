# Pope katecheza downloader
source /etc/messages.sh
WEBSITE=http://papiez.wiara.pl/

# Checks argument list
if [ $# -ne 0 ]; then
    if [ $@ = "show" ] && [ -f ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt ]; then
        # Only show a document
        kate ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt
        exit 0
    fi
fi

mkdir -p ~/Dokumenty/katechezyPapieskie/
# If there exists katechesis then backup it
if [ -f  ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt ]; then
    minfo "Backup of old katechesis and md5check."
    md5Old=$(md5sum ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt)
    cp ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.old.txt
fi

# Downloading all katechesis
minfo "Downloading of all katechesis topics."
wget http://papiez.wiara.pl/Franciszek/Katechezy -O Katechezy.html & >/dev/null && sleep 5
link=$(cat -v Katechezy.html | grep -z "class=\"dl_sub cf attach.*class=\"pgr" -o | grep -P "href.*doc\/.*?\"" -o | uniq | head -n 1 | cut -c 8- | rev | cut -c 2- | rev )
echo "Pobieram:"${WEBSITE}${link} 

# Downloading the newest one
minfo "Downloading newest one."
wget ${WEBSITE}${link} -O wybranaKatecheza
tekst=$(grep -z "cf txt.*txt__tags" wybranaKatecheza -o)
echo $tekst > wyjscie.html
lynx --dump wyjscie.html > ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt

#Cleaning
minfo "Cleaning."
rm Katechezy.html wyjscie.html

#Check md5 and open if new
minfo "Checking if there is any new katechesis."
md5New=$(md5sum ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt)
if [ "$md5New" == "$md5Old" ]; then
    merror "Nothing new."
else
    msuccess "New katechesis."
    kate ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt
    echo $md5Old
    echo $md5New
fi


