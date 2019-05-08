#!/bin/sh

# 원격 저장소1 = 미러링 당하는 저장소
# 원격 저장소2 = 미러링 하는 저장소

# 원격 저장소1을 아래와 같이 클론한다.
if [ ! -d remote-repo1.mirror ]; then
	git clone --mirror ssh://git@git.falinux.com:10022/khkraining/test.git remote-repo1.mirror
fi


# remote-repo1.mirror 디렉토리로 이동한다.
cd remote-repo1.mirror

# 아래 명령으로 원격 저장소2를 지정해 준다.
git remote set-url --push origin ssh://git@git.falinux.com:10022/khkraining/test1.git

cd ../

# 원격 저장소1을 클론한다.
if [ ! -d remote-repo1 ]; then
	git clone ssh://git@git.falinux.com:10022/khkraining/test.git remote-repo1
fi

# 원격 저장소1에 디렉토리 및 파일을 업로드한다.
cd remote-repo1
git ls
echo "--------------------"
echo "add driectory name input=" | tr -d "\n"
read dirname
echo $dirname
mkdir $dirname
touch $dirname/.empty
git add .
git commit . -m "$dirname add"
git push
cd ../

# 원격 저장소2에 적용한다.
cd remote-repo1.mirror
git remote update
git push --mirror
cd ../

# 원격 저장소2에 적용되었는지 확인한다.
if [ ! -d remote-repo2 ]; then
	git clone ssh://git@git.falinux.com:10022/khkraining/test1.git remote-repo2
fi
cd remote-repo2
git pull
cd ../

rm remote-repo* -rf
