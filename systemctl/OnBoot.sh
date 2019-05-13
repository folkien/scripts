#!/bin/bash
# Script run every 3 hours
notify-send-all "Update repozytoriów!"

# Update scripts
echo "Update of scripts."
cd ${scripts}
git pull --rebase

# Update python repos
for directory in /home/${USER}/python/*; do
    if [ -d ${directory} ]; then
        echo "Update of ${directory}."
        cd ${directory}
        git pull --rebase
    fi
done
