#!/bin/sh

# git clone ssh://git@git.falinux.com:10022/khkraining/test.git
# https://help.github.com/en/articles/about-git-subtree-merges

mkdir test
cd test
git init
touch README.md
echo "subtree test" > README.md 

git add .
git commit . -m "first commit"
git remote add -f test ssh://git@git.falinux.com:10022/khkraining/test.git
git merge -s ours --no-commit test/master
git read-tree --prefix=remote-repo1 -u test/master
git commit -m "Subtree merged in test"


