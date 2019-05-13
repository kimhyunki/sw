#/bin/sh


git clone ssh://git@git.falinux.com:10022/khkraining/test0.git
cd test0

git submodule add ssh://git@git.falinux.com:10022/ondevciesw/icezero-board.git

git add .
git commit -m "icezero-board repo submodule add"
git push
exit

rm new -rf
git clone ssh://git@git.falinux.com:10022/khkraining/test0.git new 

git clone new old

cd new
git rm target -r
git submodule add ssh://git@git.falinux.com:10022/khkraining/test1.git target

exit





cd test0
git submodule add ssh://git@git.falinux.com:10022/khkraining/test1.git externel

exit

git filterr-branch --prune-empty --subdirectory-filter . master
exit



exit

git remote set-url --push origin ssh://git@git.falinux.com:10022/khkraining/test1.git

exit

