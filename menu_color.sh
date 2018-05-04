#!/bin/bash
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
RES='\E[0m'
function usage(){
	echo "USAGE:$0 {1|2|3|4}"
	exit 1
}

function menu(){
	cat <<END
	1.apple
	2.pear
	3.banana
	4.haha
END
}

function chose(){
read -p "pls input you choice:" a
case $a in
	1)
		echo -e "${RED_COLOR}apple${RES}"
		;;
	2)
		echo -e "${GREEN_COLOR}pear${RES}"
		;;
	3)
		echo -e "${YELLOW_COLOR}banana${RES}"
		;;
	3)
		echo -e "${BLUS_COLOR}haha${RES}"
		;;
	*)
		usage
esac
}

function main(){
	menu
	chose
}
main
