#!/bin/bash
# runs service as user with insallation user and ENV
echo "Run ${@} as ${USER}."
sudo -u ${USER} "${@}"
