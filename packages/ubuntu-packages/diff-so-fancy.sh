# 
# -------------------------------------
cd ${git}
rm -rf diff-so-fancy
git clone git@github.com:so-fancy/diff-so-fancy.git
cd diff-so-fancy
git checkout v1.2.7

sudo ln -sf $(pwd)/diff-so-fancy /usr/bin/diff-so-fancy
