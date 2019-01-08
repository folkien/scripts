cd $git
git clone git@github.com:tonsky/FiraCode.git
rm -rf FiraCode
git clone git@github.com:tonsky/FiraCode.git
sudo cp -rfv FiraCode/distr/ttf /usr/local/share/fonts/firacode-ttf
sudo cp -rfv FiraCode/distr/ /usr/local/share/fonts/firacode-
sudo fc-cache -fv
