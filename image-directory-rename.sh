# Skrypy do zmiany nazwy katalogu z obrazami.
if [ $# -gt 0 ]; then
    directory="$@"
fi

# Find oldest file in directory.
filename=$(file-oldest ${directory})
echo "Oldest file is ${filename}."

# Get Year and Month.
year=$(date -r ${filename} "+%Y")
month=$(date -r ${filename} "+%m")




