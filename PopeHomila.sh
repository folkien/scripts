#TODO change on deon.pl because it's better.
WEBSITE=http://papiez.wiara.pl/
if [ -e Homilie  ]; then
    rm -rf Homilie
fi
wget http://papiez.wiara.pl/Franciszek/Homilie
#LinksAll=$(grep -z "class=\"pgr_top.*class=\"pgr" Homilie -o | grep -P "href.*doc\/.*?\"" -o | uniq | sort)
link=$(grep -z "class=\"pgr_top.*class=\"pgr" Homilie -o | grep -P "href.*doc\/.*?\"" -o | uniq | sort | head -n 1 | cut -c 8- | rev | cut -c 2- | rev )
echo ${WEBSITE}${link}

wget ${WEBSITE}${link} -O Homilia

