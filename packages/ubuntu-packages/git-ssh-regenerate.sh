ssh-keygen -t rsa -C "folkus@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
