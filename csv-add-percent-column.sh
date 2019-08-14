[ $# -eq 0 ] && echo "No file argument!" && exit 1

file="$1"
outputFile="percent${file}"
fileLines=$(cat ${file} | wc -l)

# reset file
echo "" > ${outputFile}

lineNumber=1
# For each file line
while read line; do
  percentValue=$(echo "scale=4; $lineNumber*100/$fileLines" | bc)
  echo "${percentValue} ${line}" >> ${outputFile}
  lineNumber=$((${lineNumber} + 1))
  progress=$(( $lineNumber*100/${fileLines} ))
  echo -ne "\rProgress ${progress}%"
done < ${file}
