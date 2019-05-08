#!/bin/sh

# 원격 저장소1 = 미러링 당하는 저장소
REMOTE_REPO1_DIR=remote-repo1
REMOTE_REPO1=ssh://git@git.falinux.com:10022/khkraining/test.git 

# 원격 저장소2 = 미러링 하는 저장소
REMOTE_REPO2_DIR=remote-repo2
REMOTE_REPO2=ssh://git@git.falinux.com:10022/khkraining/test1.git

# 원격 저장소1을 아래와 같이 클론한다.
if [ ! -d remote-repo1.mirror ]; then
	git clone --mirror $REMOTE_REPO1 $REMOTE_REPO1_DIR.mirror
fi

# 아래 명령으로 원격 저장소2를 지정해 준다.
cd $REMOTE_REPO1_DIR.mirror
git remote set-url --push origin $REMOTE_REPO2
cd ../

# 원격 저장소1을 클론한다.
if [ ! -d $REMOTE_REPO1_DIR ]; then
	git clone $REMOTE_REPO1 $REMOTE_REPO1_DIR
fi

# 원격 저장소1에 디렉토리 및 파일을 업로드한다.
cd $REMOTE_REPO1_DIR
git ls
echo "--------------------"
echo "add driectory name input=" | tr -d "\n"
read dirname
mkdir $dirname
touch $dirname/.empty
git add .
git commit . -m "$dirname add"
git push
cd ../

# 원격 저장소2에 적용한다.
cd $REMOTE_REPO1_DIR.mirror
git remote update
git push --mirror
cd ../

# 원격 저장소2에 적용되었는지 확인한다.
if [ ! -d $REMOTE_REPO2_DIR ]; then
	git clone $REMOTE_REPO2 $REMOTE_REPO2_DIR
fi
cd remote-repo2
git pull
cd ../

rm remote-repo* -rf
