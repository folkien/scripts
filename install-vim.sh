#!/bin/bash
source ~/.bashrc
cd $boisko
curl http://j.mp/spf13-vim3 -L -o - | sh
ln -sf $scripts/.vimrc.local ~/.vimrc.local
ln -sf $scripts/.gvimrc.local ~/.gvimrc.local
ln -sf $scripts/.vimrc.bundles.local ~/.vimrc.bundles.local

#bitbake scripts
mkdir -p ~/.vim/bundle/bitbake/
cd ~/.vim/bundle/bitbake/
git clone git@github.com:kergoth/vim-bitbake.git ./
ln -sf $scripts/.vimrc.bundles.local ~/.vimrc.bundles.local
