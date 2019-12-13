#!/bin/bash

sudo apt-get install curl

# 마이크로소프트 GPG 키를 다운로드하여 /etc/apt/trusted.gpg.d/ 경로에 복사해줍니다.

sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'

# Visual Studio Code를 다운로드 받기 위한 저장소를 추가합니다.
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# 추가한 저장소로부터 패키지 목록을 가져옵니다.
sudo apt-get update

# Visual Studio Code를 설치합니다.
sudo apt-get install code







