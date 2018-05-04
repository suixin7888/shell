#!/bin/bash
path=/opt/nginx/sbin
pid=/opt/nginx/conf/nginx.pid
RETVAL=0
. /etc/init.d/functions

start(){
	if [ ! -f $pid ];then
		$path/nginx
		RETVAL=$?
		if [ $RETVAL -eq 0 ];then
			action "nginx is stared" /bin/true
			return $RETVAL
		else
			action "nginx is not started" /bin/false
			return $RETVAL
		fi
	else
		echo "nginx is running"
		return 0
	fi
}
stop(){
	if [ -f $pid ];then
		$path/nginx -s stop
		RETVAL=$?
		if [ $RETVAL -eq 0 ];then
			action "nginx is stoped" /bin/true
			return $RETVAL
		else
			action "nginx is stoped" /bin/false
			return $RETVAL
		fi
	else
		echo "nginx is no running"
		return $RETVAL
	fi
}

case $1 in
	start)
		start
		RETVAL=$?
		;;
	stop)
		stop
		RETVAL=$?
		;;
	restart)
		stop
		sleep 1
		start
		RETVAL=$?
		;;
	*)
		echo $"USAGE:$0 {start|stop|restart}"
		exit 1
esac
exit $RETVAL
