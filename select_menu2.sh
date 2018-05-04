#!/bin/bash
PS3="Please select a num from menu:"

select name in oldboy oldgirl suixin
do
	echo -e "i guess you selected the menu is:\n $REPLY) $name"
done
