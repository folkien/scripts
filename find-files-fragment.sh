if [ $# -lt 1 ]; then
    echo "Please specify argument."
    exit 1
fi

suffix="[XX]"
argument="${1}"

parseFile()
{
    filePath=$1
    cat ${filePath} | xargs -I % echo -n ${suffix} % > ${filePath}.parsed
    cat ${filePath}.parsed | grep "$argument.*\};" -o > ${filePath}.found
    return 0
}

export -f parseFile
find ./ | grep hardware_conf | xargs -I {} bash -c 'parseFile "$@"' _ {}
