filePath=$1
cat $1 | sed '/^[[:space:]]*$/d' > $1.noEmptyLines
echo "Created $1.noEmptyLines ."
