sudo apt-get  -yf install radiotray

#Install for every user
for D in /home/*; 
do
    user=$(basename ${D})
    echo "Install for ${D}. User ${user}."
    sudo mkdir -p $D/.local/share/radiotray/
    sudo ln -svf ${scripts}/.config/radiotray/bookmarks.xml ${D}/.local/share/radiotray/bookmarks.xml
    sudo chown -R ${user}.${user} $D/.local/share/radiotray/
done


