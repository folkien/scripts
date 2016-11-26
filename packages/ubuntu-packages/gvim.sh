#podmianka edytora
sudo mv /usr/bin/gedit /usr/bin/gedit.old
sudo ln -s /usr/bin/gvim /usr/bin/gedit

# Instalacja pathogena
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Instalacja Vundle'a
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
