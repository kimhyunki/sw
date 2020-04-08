#!/bin/sh

sudo apt-get install -y curl

which docker >/dev/null || curl -sSL https://get.docker.com/ | sh
docker build -t armgpu .

mkdir -p ~/bin/
cp armgpu ~/bin/
