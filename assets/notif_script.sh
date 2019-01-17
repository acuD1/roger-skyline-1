#!/bin/bash
[[ -z `find /etc/crontab -mmin -1440` ]]
if [ $? -eq 0 ]
then
	echo "/etc/crontab has not been modified since last check" | mailx -s 'Notification for /etc/crontab' root@rs1
else
	echo "/etc/crontab has been modified since last check" | mailx -s 'Notification for /etc/crontab' root@rs1
fi
