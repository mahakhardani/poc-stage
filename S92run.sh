#!/bin/bash

NAME="docker"
IMAGE_NAME=python-poc

build() {
	docker build -t ${IMAGE_NAME} .
}

run() {
         RUNNING=`docker inspect -f '{{.State.Running}}'  ${NAME}`

        if [[ ${RUNNING} == "true" ]]; then
            #
            # No need to start it
            #
            echo "Process is running"
            exit 1;
        elif [[ ${RUNNING} == "false" ]]; then
            #
            # Container created
            #
            echo "Starting container:"
            docker start ${NAME}
         else
            echo "Creating '$NAME' container.."
            docker run  --name ${NAME}  ${IMAGE_NAME}
	 fi
	    }
case  "$1" in 
	start) build
	       run;;
esac
