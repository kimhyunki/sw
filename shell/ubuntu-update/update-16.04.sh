#!/bin/bash

OK=a
CMP=a


if [ "$OK" == "$CMP" ]; then

	echo "OK"
sudo apt-get upgrade

sudo apt-get update

sudo apt install -y vim openssh-server git-core subversion minicom \
			build-essential lzop u-boot-tools ctags \
			texi2html apt-file genext2fs texinfo lib32ncurses5-dev \
			xinetd tftpd tftp terminator samba cifs-utils
exit

else 

if [ ! -f /etc/xinetd.d/tftp ]; then


	echo "not find /etc/xinetd.d/tftp"

#	echo "
#	service tftp
#	{
#	    socket_type     = dgram
#	    protocol        = udp
#	    wait            = yes
#	    user            = root
#	    server          = /usr/sbin/in.tftpd
#	    server_args     = -s /tftpboot
#	    disable         = no
#	    per_source      = 11
#	    cps             = 100 2
#	    flags           = IPv4
#	}
#	" > /etc/xinetd.d/tftp
else

	echo "find /etc/xinetd.d/tftp"
fi

mkdir ~/docker
cd ~/docker
sudo wget -qO- https://get.docker.io/ | sh
sudo usermod -aG docker ${USER}
sudo gpasswd -a ${USER} docker
sudo service docker restart

exit

rm ~/.vim ~/.vimrc -rf
git clone https://github.com/ygpark/vimconfig.git ~/vimconfig
~/vimconfig/install.sh

fi

sudo usermod -a -G dialout $USER




exit

ln -s /home/khk/work/tftpboot /tftpboot

sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot

sudo /etc/init.d/xinetd restart







sudo apt-get install -y terminator

vi .config/terminator/config

[global_config]
[keybindings]
[profiles]
[[default]]
use_system_font = False
background_image = None
foreground_color = "#ffffff"
scroll_on_output = False
font = 나눔고딕코딩 12
scrollback_infinite = True
[layouts]
[[default]]
[[[child1]]]
type = Terminal
parent = window0
[[[window0]]]
type = Window
parent = ""
[plugins]


