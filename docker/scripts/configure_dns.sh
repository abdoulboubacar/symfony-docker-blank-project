#!/bin/bash
if ! [ $(id -u) = 0 ]; then
	echo "You must be root to do this." 1>&2
	exit 100
fi

function sethosname() {
	HOSTNAME=$1
	CONTAINER_NAME=$2
	IP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME`
	if grep -q $HOSTNAME /etc/hosts; then
		sed -i "s/\(.*\)$HOSTNAME/$IP 	$HOSTNAME/g" /etc/hosts
	else
		echo "$IP 	$HOSTNAME" >> /etc/hosts
	fi
	echo "container '$CONTAINER_NAME:$IP' is set to : http://$HOSTNAME"
}

sethosname project-docker.lan project
sethosname project-docker-bdd.lan project_mysql
