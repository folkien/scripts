if [ $# -lt 1 ]; then
    echo "Please specify argument."
    exit 1
fi

argument="${1}"

parseFile()
{
    suffix="[XX]"
    filePath=$1
    echo "Found $filePath."
    cat ${filePath} | xargs -I % echo -n ${suffix} % > ${filePath}.parsed
    cat ${filePath}.parsed | grep "$argument.*\};" -o > ${filePath}.found
    return 0
}

export -f parseFile
find ./ | grep "hardware_conf\.h$" | xargs -I {} bash -c 'parseFile "$@"' _ {}
