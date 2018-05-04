#!/bin/bash
trapper(){
    trap ':' INT EXIT TSTP TERM HUP
}
menu(){
cat <<EOF
    1)suixin-192.168.25.221
    2)exit
EOF
}
main(){
while :
do
    trapper
    clear
    menu
    read -p "pls input a num:" num
    case "$num" in
        1)
            echo 'login 192.168.25.221'
            ssh 192.168.25.221
            ;;
        110)
            read -p "you birthday:" char
            if [ "$char" = "0910" ];then
                exit
                sleep 3
            fi
            ;;
        *)
            echo "select error."
    esac
done
}
main
