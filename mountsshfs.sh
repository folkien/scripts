#!/bin/bash
# Skrypt uruchamiany przy starcie systemu. Dopoki nie zamontuje to proboje.

if [ -f /tmp/sshfsmonted ] ; then
		echo "Zamontowane juz."
		exit 0
else
		is_not_mounted=1
		while [ $is_not_mounted -ne 0 ] ; do
				sshfs jpasz@jpaszpc:Dokumenty/Skany Dokumenty/Skany -o rw
				sshfs jpasz@jpaszpc:Udostepnione /home/spasz/Udostepnione/ -o rw
				is_not_mounted=$?
				sleep 120
				# Czekamy 2 minuty i probujemy znowu.
		done
		touch /tmp/sshfsmonted
fi

