#!/bin/sh


rm test0 -rf
git clone --recursive ssh://git@git.falinux.com:10022/khkraining/test0.git
cd test0


git submodule update --remote --rebase
git add . 
git commit -m "submodule sync"
git push

cd submodule_dir
git checkout -b stable
ls
echo "--------------------"
echo "add file name input=" | tr -d "\n"
read dirname
touch $dirname
git add .
git commit . -m "$dirname add"
git checkout master
git merge stable
git push
cd ../
git add . 
git commit -m "submodule sync"
git push
exit
