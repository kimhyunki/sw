FROM ubuntu:14.04

RUN locale-gen en_US.UTF-8
RUN update-locale

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN sed -ri 's/\/archive\.ubuntu\.com/\/kr\.archive\.ubuntu\.com/g' /etc/apt/sources.list

RUN \
    apt-get update && \
    apt-get -y install openjdk-7-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev \
gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip realpath \
pkg-config libusb-1.0-0-dev scons cmake cpio sed patch subversion \
python bc lzop uuid uuid-dev zlib1g-dev liblz-dev liblzo2-2 liblzo2-dev u-boot-tools mtd-utils android-tools-fsutils vim && \
    rm -rf /var/lib/apt/lists/* && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && \
    chmod a+x /bin/repo

CMD ["/bin/bash"]

WORKDIR /work
