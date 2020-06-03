#!/bin/sh

IMAGE_NAME=python-poc

build() {
	docker build -t ${IMAGE_NAME} .
}

run()  {
       #
       # Container created
       #
         echo "Starting then creating container:"
         docker run  ${IMAGE_NAME}
       }

case  "$1" in 
	start) build
	       run;;
esac
