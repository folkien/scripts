#instalacja skryptów w systemie
DIR=`pwd`
cd /usr/bin/
ln -s $DIR/pushf.sh pushf
ln -s $DIR/popf.sh popf
ln -s $DIR/cps.sh cps
ln -s $DIR/git-create-repository.sh git-create-repository
ln -s $DIR/tars.sh tars
 
cd $DIR
cp -rfv colors.sh /etc/
