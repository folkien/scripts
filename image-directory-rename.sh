# Skrypty do zmiany nazwy katalogu z obrazami.
directory=""
if [ $# -gt 0 ]; then
    directory="$@"
fi

if [ ! -d ${directory} ]; then
    echo "Directory doesn't exists."
    exit 1
fi

# Find oldest file in directory.
filename=$(file-oldest ${directory})
echo "Oldest file is ${filename}."

# Get Year and Month.
year=$(date -r ${filename} "+%Y")
month=$(date -r ${filename} "+%m")
echo "Year.Month = ${year}.${month}"

# Check directory name
directoryName=$(basename ${directory})

# If year exists then remove it
echo ${directoryName} | grep ${year}
if [ $? -eq 0 ]; then
    directoryName=$(echo ${directoryName} | sed "s/[0-9][0-9][0-9][0-9]//g")
fi

# If month exists then remove it
echo ${directoryName} | grep ${month}
if [ $? -eq 0 ]; then
    directoryName=$(echo ${directoryName} | sed "s/[0-9][0-9]//g")
fi

# Add Year/Month prefix
directoryName=${year}"."${month}"-"${directoryName}

# Proposition
echo ""

dialog --title "Change ${directory} to ${directoryName} ?" \
        --yesno "Original name : ${directory}. \nNew name : ${directoryName}." 10 80
response=$?
case $response in
    0)
        # Yes
        echo yes
        ;;
    1)  echo no
        ;;
    255)
        echo "Interrupted merge!"
        exit -1;
        ;;
esac

