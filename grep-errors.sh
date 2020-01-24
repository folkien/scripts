# Grep for all types of errors
echo "Checking with grep current directory for common error messages..."
command="grep --color=always -a -n -r ./"
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
