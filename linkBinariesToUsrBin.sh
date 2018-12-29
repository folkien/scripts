CurrentDirectory=$(pwd)
DEST=/usr/bin/
SOURCE=${1}
cd ${DEST}
sudo ls ${SOURCE} | sudo xargs  -I {} ln -sfv ${SOURCE}{} ./
if [ $? -ne 0]; then
	echo "Operation failed."
fi
cd ${CurrentDirectory}
