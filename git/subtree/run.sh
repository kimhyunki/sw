#!/bin/sh

# git clone ssh://git@git.falinux.com:10022/khkraining/test.git
# https://help.github.com/en/articles/about-git-subtree-merges


if [ ! -d test ]; then
git clone ssh://git@git.falinux.com:10022/khkraining/test.git
fi

if [ ! -d test1 ]; then
git clone ssh://git@git.falinux.com:10022/khkraining/test1.git
fi

# test에 test1에 추가한다.
cd test
git remote add test1 ssh://git@git.falinux.com:10022/khkraining/test1.git
git fetch test1 --no-tags
git checkout -b test_branch test1/master

# test1 프로젝트를 test의 하위디렉토리로 만들수 있다.
#git read-tree --prefix=test1 -u test_branch
#git checkout master 
#git merge --squash -s recursive -Xsubtree=test1 test_branch
cd ../

exit

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


