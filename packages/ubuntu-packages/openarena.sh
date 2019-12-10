#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

sudo apt install -yf openarena
#Link settings
rm -rf ~/.openarena/
ln -sfv ${DIR}/openarena ~/.openarena

# Fix ubuntu bug
cd /tmp
wget http://cz.archive.ubuntu.com/ubuntu/pool/universe/i/ioquake3/ioquake3_1.36+u20160122+dfsg1-1_amd64.deb -O ioquake.deb
ar x ioquake.deb data.tar.xz
tar Jxf data.tar.xz
sudo mv ./usr/lib/ioquake3/ioquake3 /usr/lib/ioquake3/ioquake3
