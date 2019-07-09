# List connected usb mass storage devices.
drives=$(usb-list-drives)
drive=$(dialog --title "List of USB drives" --no-items --menu "Chose one" 24 80 17 ${drives} 3>&2 2>&1 1>&3) # show dialog and store output
echo $drive
