#/bin/sh

rm amp -rf
git clone  ssh://git@git.falinux.com:10022/khkraining/amp.git

exit

cd amp
mkdir repo1
cd repo1
git submodule add -b master ssh://git@git.falinux.com:10022/khkraining/amp.git ampmirror
cd ../../

cd amp
mkdir repo2
cd repo2
git submodule add -b master ssh://git@git.falinux.com:10022/khkraining/amp.git ampmirror
git commit -m "added appmirror submodule"
cd ../../



