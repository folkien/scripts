#!/bin/bash
DYSK=$1

do_test() 
{
	DRIVE=$1
	echo "Test zapisu."
	dd if=/dev/zero bs=1M count=100 | pv | dd of=$DRIVE
	echo "Test odczytu."
	dd if=$DRIVE bs=1M count=100 | pv | dd of=/dev/null
}

while true; do
	read -p "Ten test usunie dane na dysku. Czy kontynuowac?" yn
    case $yn in
        [Yy]* ) do_test $DYSK; break;;
        [Nn]* ) exit;;
        * ) echo "Odpowiedz tak lub nie.";;
    esac
done
