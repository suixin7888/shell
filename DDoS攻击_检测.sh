#!/bin/bash
file=$1
while true
do
	awk '{print $1}' /opt/nginx/logs/access.log |sort|uniq -c >/tmp/tmp.log
	exec </tmp/tmp.log
	while read line
	do
		ip=`echo $line|awk '{print $2}'`
		count=`echo $line|awk '{print $1}'`
		if [ $count -gt 130 ] && [ `iptables -L -n|grep "$ip"|wc -l` -lt 1 ]
			then
				iptables -I INPUT -s $ip -j DROP
				echo "$line is dropped"
		fi
	done
	sleep 60
done
