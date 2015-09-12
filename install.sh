#instalacja skryptów w systemie
DIR=`pwd`
cd /usr/bin/
ln -s $DIR/pushf.sh pushf
ln -s $DIR/popf.sh popf
ln -s $DIR/cps.sh cps
ln -s $DIR/git-create-repository.sh git-create-repository
ln -s $DIR/tars.sh tars
ln -s $DIR/trim.py trim
ln -s $DIR/after.py after
ln -s $DIR/volumeup.sh volumeup
ln -s $DIR/volumedown.sh volumedown
ln -s $DIR/ysess.py ysess
 
cd $DIR
cp -rfv colors.sh /etc/
