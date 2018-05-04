#!/bin/bash
. /etc/init.d/functions
user="oldboy"
passfile="/tmp/user.log"

for num in `seq -w 10`
do
	pass="`echo $RANDOM|md5sum|cut -c3-11`"
	useradd $user$num &>/dev/null
	echo $pass|passwd --stdin $user$num &>/dev/null &&\
	echo -e "user:$user$num\tpasswd:$pass">>$passfile
	if [ $? -eq 0 ];then
		action "$user$num is ok"	/bin/true
	else
		action "$user$num is fail"	/bin/false
	fi
done
