#!/bin/bash
# Zmienna GIT_REPO_DIR musi być wcześniej ustawiona.
if [ $# -gt 0 ] ; then
	REPOSITORYNAME=$1
else
	echo "Podaj nazwe repozytorium."
	exit 1
fi

mkdir $REPOSITORYNAME
cd $REPOSITORYNAME
git init --bare
