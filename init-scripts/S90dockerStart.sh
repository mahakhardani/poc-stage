#!/bin/sh
#
#

start() {
	touch /etc/docker/daemon.json
        echo '{ "insecure-registries" : ["registry.hub.docker.com"] }' > /etc/docker/daemon.json
	dockerd &
	echo "OK"

}


case "$1" in
    start) start;;
esac

