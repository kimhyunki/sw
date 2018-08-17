#!/bin/bash
#
# author	Kim Hyun-ki <khkraining@gmail.com>
# date          2018-08-17
# brief         ethercat carrier gpio 제어
#
#------------------------------------------------------------------------------#

# GPIO : control reset & dout 
array_control_reset=("1005")

#GPIO : dout
array_dout=("1006" "1007" " 1008" "1009")

# GPIO : monitor
array_monitor_y=("1010" "1011" "1012" " 1013")

# GPIO : din
array_din=("1014" "1015" "1016" " 1017")

# GPIO : feed
array_feed=("1018" "1019" "1020" "1021")                                       

# GPIO : voltage
array_voltage=("1023" "1024")	# 24V, 12V

#------------------------------------------------------------------------------#

SYS_PATH=/sys/class/gpio/
EXPORT_PATH=$SYS_PATH/export

init_export_gpio () {
	echo $1 > $EXPORT_PATH
}

for_array()
{
	declare -a arr=("${@}")		# 변수타입 지정 배열
	declare -i len=${#arr[@]}	# 변수타입 지정 정수

	# Show passed array
	for ((i = 0; i < len; i++))
	do init_export_gpio ${arr[$i]}
	done
}

init_gpio () {

	echo " - gpio export init : control reset"
	for_array "${array_control_reset[@]}"

	echo " - gpio export init : dout"
	for_array "${array_dout[@]}"

	echo " - gpio export init : monitor y"
	for_array "${array_monitor_y[@]}"

	echo " - gpio export init : din"
	for_array "${array_din[@]}"

	echo " - gpio export init : feed"
	for_array "${array_feed[@]}"

	echo " - gpio export init : voltage"
	for_array "${array_voltage[@]}"
}

dout_set () {
	echo out > $SYS_PATH/gpio$1/direction
	echo 0 > $SYS_PATH/gpio$1/value
#	echo $EXPORT_PATH/gpio$1/direction
}


dout_on () {
	declare -a arr=("${@}")		# 변수타입 지정 배열
	declare -i len=${#arr[@]}	# 변수타입 지정 정수

	# Show passed array
	for ((i = 0; i < len; i++))
	do
		dout_set ${arr[$i]}
	done
}

din_set () {
	echo in > $SYS_PATH/gpio$1/direction
	cat $SYS_PATH/gpio$1/value
#	echo $EXPORT_PATH/gpio$1/direction
}

din_on () {
	declare -a arr=("${@}")		# 변수타입 지정 배열
	declare -i len=${#arr[@]}	# 변수타입 지정 정수

	# Show passed array
	for ((i = 0; i < len; i++))
	do
		din_set ${arr[$i]}
	done
}



main () {

	if [ -d "$SYS_PATH/gpio1005" ]; then
		echo " * gpio init ok"
		dout_on "${array_control_reset[@]}"
		dout_on "${array_dout[@]}"
		din_on "${array_din[@]}"

	else
		echo " * gpio init start"
		init_gpio
	fi
}

main


