#!/bin/sh


rm test0 -rf
git clone --recursive ssh://git@git.falinux.com:10022/khkraining/test0.git
cd test0

git checkout -b stable
git submodule update --remote --merge

cd submodule_dir
touch 2
git add . 
git commit -am 'touch 2'
cd ../

git submodule update --remote --rebase

cd submodule_dir/
touch 3
git add .
git commit -am "3 add test0 repo"
git submodule update --remote --rebase
cd ..
git submodule update --remote --rebase
exit
git add .
git commit -a -m "submodule update --remote --rebase"
git push
ls
cd submodule_dir/
ls
git push
git pull
git pull origin
git pull origin master
git pull
git pull origin master
git push origin master
git branch
git checkout master 
git st .
git branch
git st .
git ls
exit
ls
cd ..
ls
git st .
cd -
cd .
ls
git submodule update --remote
git st .
history
ls
cd ..
ls
git submodule update --remote
git ls
ls
cd submodule_dir/
ls
cd ..
ls
git ls
git st .
git add .
git commit -m "asdf"
git push
git submodule update --remote --merge
cd submodule_dir/
l
touch 3 
git commit -am 'submodule repo touch 3"
git commit -am 'submodule repo touch 3'
git add .
git commit -am 'submodule repo touch 3"
git commit -am 'submodule repo touch 3'
git submodule update --remote --rebase
cd ..
git submodule update --remote --rebase
git submodule update --remote 
ls
cd submodule_dir/
ls
touch 3
git add .
git commit -am "test repository touch 3 "
cd ..
ls
git submodule update --remote --merge
git st .
git add .
git commit -m "merge"
git push
ls
cd submodule_dir/
ls
git push
git pull origin master
git push
git push origin master
ls
cd ..
ls
git submodule update --retmoe
git submodule update --remote
git add .
git commit -am "asdf"
git push
ls
cd submodule_dir/
ls
touch 3
git add .
git commit -am "touch 3 add"
git push
git branch
git checkout master
git st .
ls
git pull
ls
touch 3
git ls
ls
git add .
git commit -a "test repo touch 3"
git commit -am "test repo touch 3"
git push
ls
