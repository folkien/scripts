#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage (website) (sha)"
    exit 1
fi

rm -rf HF.log

url=$1
hashToFind=$2
[ $# -ge 3 ] && showGrepResult=1 || showGrepResult=0
[ $# -ge 4 ] && grepSurrounding=$4 || grepSurrounding=0

# Get index URL
wget ${url} -O index.html &> /dev/null
grep -a -o "href=\"\/hf\/.*\"" index.html | cut -c 7- | rev | cut -c 2- | rev | while read -r deviceUrl ;
do
    # Get device website
    wget "${url}${deviceUrl}" -O tmpDevice.html &> /dev/null
    hfAmount=$(grep -a "tr id.*" tmpDevice.html | wc -l)
    emptyCommentAmount=$(grep -a "id=\"comment\"" tmpDevice.html | grep value=\"\" | wc -l)
    commentAmount=$(($hfAmount-$emptyCommentAmount))
    grep -a -o "href=\"/hf\/.*\"" tmpDevice.html | cut -c 7- | rev | cut -c 2- | rev | while read -r hfUrl ;
    do
        # Get HF website
        wget "${url}${hfUrl}" -O tmpHf.html &> /dev/null
        [ ${showGrepResult} -eq 1 ] && grep -a -C ${grepSurrounding} "${hashToFind}" tmpHf.html || grep -a "${hashToFind}" tmpHf.html &> /dev/null
        if [ $? -eq 0 ]; then
            hfUrl=${hfUrl// /%20}
            echo "# \"${url}${hfUrl}\" (${commentAmount}/${hfAmount}) find ${hashToFind}." | tee -a HF.log
            touch isFound.log
        fi
    done
    # If found then show comments
    if [ -e isFound.log ]; then
        comments=$(grep -a "id=\"comment\"" tmpDevice.html | grep -P "value\=\".*?\" " -o)
        echo "${comments}"
        rm -rf isFound.log
    fi
done

rm -rf index.html tmpDevice.html tmpHf.html


