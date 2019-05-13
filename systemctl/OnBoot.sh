#!/bin/bash
results=""

# Update scripts
echo "Update of scripts."
cd ${scripts}
git pull --rebase
if [ $? -ne 0 ]; then
    results="${results} Scripts=Error\n"
else
    results="${results} Scripts=OK\n"
fi

# Update python repos
for directory in /home/${USER}/python/*; do
    if [ -d ${directory} ]; then
        echo "Update of ${directory}."
        cd ${directory}
        git pull --rebase
        dirname=$(basename ${directory})
        if [ $? -ne 0 ]; then
            results="${results} ${dirname}=Error\n"
        else
            results="${results} ${dirname}=OK\n"
        fi
    fi
done

notify-send-all "Update repozytoriów!\n \n${results}"
