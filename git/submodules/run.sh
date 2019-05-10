#/bin/sh

git clone ssh://git@git.falinux.com:10022/khkraining/test0.git
cd test0
touch 1
touch 2
touch 3
git add .
git commit -m "1,2,3 first commit"
git push -u origin master

git submodule add ssh://git@git.falinux.com:10022/khkraining/test1.git submodule_dir

git commit -am "added submodule_dir"
git push origin master

exit
