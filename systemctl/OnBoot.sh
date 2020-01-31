#!/bin/bash

# Update scripts
# -------------------------------------------------------
results_str=""

echo "Update of scripts."
cd ${scripts}
git-sync
./install.sh
results_str="${results_str} Scripts=OK\n"

# Update python repos
for path in /home/${USER}/python/*; do
    # If path is directory
    if [ -d ${path} ]; then
        # if directory has .git repository inside
        if [ -e ${path}/.git ]; then
            # Get directory name
            dirname=$(basename ${path})

            # Update git repository
            echo "Update of ${path}."
            cd ${path}
            git-sync
            result=$?

            # Create result message
            if [ ${result} -ne 0 ]; then
                results_str="${results_str} ${dirname}=Error\n"
            else
                results_str="${results_str} ${dirname}=OK\n"
            fi
        fi
    fi
done

notify-send-all "Update repozytoriów!\n \n${results_str}"
# -------------------------------------------------------

# Stock
# -------------------------------------------------------
stock-alarms -c
# -------------------------------------------------------

# Katechezy papieskie
# -------------------------------------------------------
Katechezy
# -------------------------------------------------------
