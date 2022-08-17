#!/bin/bash

nohup sudo apt update -y &

SERVICE="apache2"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    # uncomment to start nginx if stopped
    nohup sudo systemctl start $SERVICE
    # mail  
fi
if [ -e '/var/log/apache2/access.log' ];then
	
	if [ -e '/tmp/log/access.tar' ];then
		nohup sudo tar -cvf /tmp/log/access_$(date "+%Y.%m.%d-%H.%M.%S").tar '/var/log/apache2/access.log'
		
		file='/tmp/log/*'
		for i in $file;do
			nohup aws s3 mv $i s3://testey-kal/$i
		done
	else
		mkdir -p /tmp/log
		nohup sudo tar -cvf /tmp/log/access.tar '/var/log/apache2/access.log'
		file='/tmp/log/*'
		for i in $file;do
                        nohup aws s3 mv $i s3://testey-kal/$i
		done

	fi	
fi
