# Pope katecheza downloader
source /etc/messages.sh

# Checks argument list
if [ $# -ne 0 ]; then
    if [ $@ = "show" ] && [ -f ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt ]; then
        # Only show a document
        kate ~/Dokumenty/katechezyPapieskie/katechezaSrodowa.txt
        exit 0
    fi
fi

# Directory create
outDirectory="/home/${USER}/Dokumenty/katechezyPapieskie"
mkdir -p ${outDirectory}

# True if new katechesis exists
isNewDocument=0

# Loop download of all katechesis
number=1
isDocumentInProgress=1
maxNextCounter=3
tryNextCounter=${maxNextCounter}
lastDocument=""
while [ ${isDocumentInProgress} -eq 1 ]; do
    WEBSITE="https://www.deon.pl/religia/serwis-papieski/dokumenty/katechezy-audiencje/art,${number}.html"
    outFilePath="${outDirectory}/Katecheza${number}.txt"
    # If katechesis doesn't exists
    if [ ! -e ${outFilePath} ]; then
        echo "Download ${WEBSITE}."
        wget ${WEBSITE} -O current.html &> /dev/null
        if [ $? -eq 0 ]; then
            # Page exists, we can parse it
            xidel current.html -e "<div class='tresc'>{.}</div>*" > ${outFilePath}
            isNewDocument=1
            lastDocument=${outFilePath}
            tryNextCounter=${maxNextCounter}
        else
            # 404 Error
            tryNextCounter=$((${tryNextCounter}-1))
            [ ${tryNextCounter} -eq 0 ] && isDocumentInProgress=0
        fi
    fi
    number=$((${number} + 1))
done

rm current.html

# If there is new document then show it
if [ ${isNewDocument} -eq 1 ]; then
    kate ${lastDocument} &
fi
exit 0
