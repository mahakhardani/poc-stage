#!/bin/bash
#
#
#

NAME="docker"

ContainerStop() {
	echo "Stopping $NAME..."

        docker stop -t 2 ${NAME} &> /dev/null

        if [[ 0 != $? ]]; then
            echo "Could not stop container"
            exit 4;
        fi
}

DaemonStop() {
	printf "Stopping Docker "
	killall dockerd
	echo "OK"
}

case "$1" in
 stop)
     ContainerStop
     DaemonStop
     ;;
esac

