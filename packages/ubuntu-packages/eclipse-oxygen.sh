
while true; do
    read -p "Overwrite eclipse oxygen ini file?" yn
    case $yn in
        [Yy]* ) cp -rfv eclipse/eclipse-oxygen.ini /opt/eclipse/eclipse.ini; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
