#!/bin/sh

IMAGE_NAME=eu.gcr.io/dulcet-metric-268009/mahakhardani/scapin
TAG_NAME=1.1
export DOCKER_CLI_EXPERIMENTAL=enabled
build() {
	docker buildx build --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)"  --platform linux/arm64 -t ${IMAGE_NAME}:${TAG_NAME} .
0	docker save -o $HOME/buildroot/output/target/image_scapin_ARM.tar ${IMAGE_NAME}
}

build
