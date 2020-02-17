
# What to grep, path or specific file
if [ $# -eq 0  ]; then
    path="./"
else
    path="${1}"
fi

# Grep for all types of errors
echo "Checking with grep current directory for common error messages..."
command="grep --color=always -a -n -r ${path}"
${command} -e fault
${command} -e Fault
${command} -e fatal
${command} -e Fatal
${command} -e fail 
${command} -e Fail 
${command} -e fail 
${command} -e Erro
${command} -e erro
${command} -e Timeout
${command} -e timeout
echo "Done."
