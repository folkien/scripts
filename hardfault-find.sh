#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage (website) (sha)"
    exit 1
fi

url=$1
hashToFind=$2

# Get index URL
wget ${url} -O index.html &> /dev/null
grep -o "href=\"\/hf\/.*\"" index.html | cut -c 7- | rev | cut -c 2- | rev | while read -r deviceUrl ;
do
    # Get device website
    wget "${url}${deviceUrl}" -O tmpDevice.html &> /dev/null
    hfAmount=$(grep "tr id.*" tmpDevice.html | wc -l)
    emptyCommentAmount=$(grep "id=\"comment\"" tmpDevice.html | grep value=\"\" | wc -l)
    commentAmount=$(($hfAmount-$emptyCommentAmount))
    grep -o "href=\"/hf\/.*\"" tmpDevice.html | cut -c 7- | rev | cut -c 2- | rev | while read -r hfUrl ;
    do
        # Get HF website
        wget "${url}${hfUrl}" -O tmpHf.html &> /dev/null
        grep "${hashToFind}" tmpHf.html &> /dev/null
        if [ $? -eq 0 ]; then
            echo "${url}${hfUrl} (${commentAmount}/${hfAmount}) find ${hashToFind}."
        fi
    done
done

rm -rf index.html tmpDevice.html tmpHf.html


