#/bin/sh

rm test0 -rf

git clone ssh://git@git.falinux.com:10022/khkraining/test0.git
cd test0
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

exit

git clone ssh://git@git.falinux.com:10022/khkraining/test0.git

cd test0
touch 1
touch 2
touch 3
mkdir target
cd target
cp ../../test1/README.md ../../test1/bootloader-ubuntu/ . -a
git add .
git commit -m "first commit"
git push -u origin master

exit
