#!/bin/sh

if [ ! -d test ]; then
git clone ssh://git@git.falinux.com:10022/khkraining/test.git 
fi

cd test

git filter-branch --prune-empty --subdirectory-filter a master

git remote set-url --push origin ssh://git@git.falinux.com:10022/khkraining/test.git
git remote -v
git push -u origin master
cd ..

if [ ! -d test1 ]; then
	git clone ssh://git@git.falinux.com:10022/khkraining/test1.git 
fi

