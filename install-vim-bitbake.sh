#!/bin/bash
source ~/.bashrc
mkdir -p ~/.vim/bundle/bitbake/
cd ~/.vim/bundle/bitbake/
git clone git@github.com:kergoth/vim-bitbake.git ./
ln -sf $scripts/.vimrc.bundles.local ~/.vimrc.bundles.local
