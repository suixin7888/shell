#!/bin/bash
. /etc/init.d/functions
arr=(
101.89.68.172-充值网关2
101.89.68.134-oa登录
101.89.68.135-公会数据库
101.89.68.154-passport1
101.89.68.155-passport2
101.89.68.156-passport3
101.89.68.157-游戏中心
101.89.68.158-手机令牌
101.89.68.159-充值系统
101.89.68.160-p4oa
101.89.68.161-客服推广员
101.89.68.163-经销商
101.89.68.164-xcloud-suport
101.89.68.166-p5oa
101.89.68.167-p5gcenter
101.89.68.169-p6oa
101.89.68.168-p6gcenter
101.89.68.170-p7gcenter
101.89.68.171-蜀醉活动前台
101.89.68.152-手游oa		
101.89.68.151-x8-core1
101.89.68.153-绿岸交易行
)
CMD="ping -w 2 -c 2"
for ((i=0; i<`echo ${#arr[*]}`; i++))
do
	name=`echo ${arr[$i]}|awk -F "-" '{print $1}'`
	$CMD $name &>/dev/null
	if [ $? -eq 0 ];then
		action `echo ${arr[$i]}`	/bin/true
	else
		action `echo ${arr[$i]}`	/bin/false
	fi
done
