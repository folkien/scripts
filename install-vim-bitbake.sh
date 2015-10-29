#!/bin/bash
source ~/.bashrc
mkdir -p ~/.vim/bundle/bitbake/
cd ~/.vim/bundle/bitbake/
git clone git@github.com:kergoth/vim-bitbake.git ./
grep "bitbake" ~/.vimrc.bundles.local
ln -sf $scripts/.vimrc.bundles.local ~/.vimrc.bundles.local
