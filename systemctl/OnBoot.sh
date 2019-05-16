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
        if [ -e ${directory}/.git ]; then
            echo "Update of ${directory}."
            cd ${directory}
            # 1. Stash changes
            git stash

            # 2. Pull with rebase.
            git pull --rebase
            pullResult=$?
            #  if failed then abort
            if [ ${pullResult} -ne 0 ]; then
                git rebase --abort
            fi

            # 3. Restore stash
            git stash pop
            #  if failed then create information file
            if [ $? -ne 0 ]; then
                touch StashPopFailed.todo
            fi

            # Create result message
            dirname=$(basename ${directory})
            if [ ${pullResult} -ne 0 ]; then
                results="${results} ${dirname}=Error\n"
            else
                results="${results} ${dirname}=OK\n"
            fi
        fi
    fi
done

notify-send-all "Update repozytoriów!\n \n${results}"
