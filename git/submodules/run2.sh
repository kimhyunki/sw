#!/bin/sh


#rm test0 -rf
#git clone --recursive ssh://git@git.falinux.com:10022/khkraining/test0.git
#cd test0
#
#git checkout -b stable
#git submodule update --remote --merge
#
#cd submodule_dir
#touch 2
#git add . 
#git commit -am 'touch 2'
#cd ../
#
#git submodule update --remote --rebase

git add .
git commit . -m "test 2"
git push --recurse-submodules=check
git push --recurse-submodules=on-demand

cd test1
git push


