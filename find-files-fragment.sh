if [ $# -lt 1 ]; then
    echo "Please specify argument."
    exit 1
fi

argument="${1}"
argumentExpression="${argument}.*\};"

parseFile()
{
    suffix="[XX]"
    filePath=$1
    grep "${argumentExpression}" ${filePath} > /dev/null
    if [ $? -eq 0 ]; then
        echo "Found ${argumentExpression} in $filePath."
        cat ${filePath} | xargs -I % echo -n ${suffix} % > ${filePath}.parsed
        echo "grep -o -P ${argumentExpression} ${filePath}.parsed > ${filePath}.found"
        grep -o -P ${argumentExpression} ${filePath}.parsed > ${filePath}.found
    fi
    return 0
}

export -f parseFile
find ./ | grep "hardware_conf\.h$" | xargs -I {} bash -c 'parseFile "$@"' _ {}
