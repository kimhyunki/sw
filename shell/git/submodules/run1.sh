#/bin/sh

rm test0 -rf
git clone --recursive ssh://git@git.falinux.com:10022/khkraining/test0.git

cd test0/submodule_dir/

git fetch

git merge origin/master


