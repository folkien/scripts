#!/bin/bash
# Podajemy argument jak dla ssh np user@192.168.0.1

if [ $# -lt 1 ]; then
    echo "Za mało argumentów."
    echo "Podajemy argument jak dla ssh np user@192.168.0.1"
    exit 1
fi

DESTINATION=$@

if [ -d /home/$USER/.ssh/ ]; then
    echo "Wymieniam swój klucz."
    LOCALKEY=$(cat /home/$USER/.ssh/id_rsa.pub)
    ssh $DESTINATION 'echo '$LOCALKEY' >> ~/.ssh/authorized_keys'
    echo "Pobieram zdalny klucz."
    REMOTEKEY=$(ssh $DESTINATION 'cat ~/.ssh/id_rsa.pub')
    echo $REMOTEKEY >> /home/$USER/.ssh/authorized_keys 
else
    echo "Local .ssh folder doesn't exists."
fi
DET
