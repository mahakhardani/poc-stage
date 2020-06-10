# poc-stage

# Create a docker image with buildx to obtain an ARM architecture compatible with raspberry

## Configuration buildx: Enable buildx in Docker
 Using``` buildx``` as a docker CLI plugin requires using Docker 19.03
 
 1- Enable the ‘Experimental features’ option to use Docker Buildx in the Docker CLI. To enable it,```"experimental": true```  can be added to the CLI configuration file
```~/.docker/config.json```. 

2- Set the ```DOCKER_CLI_EXPERIMENTAL=enabled``` environment variable.



## Build Multi-Architecture Images

Building multi-architecture images requires a builder backed by the ***docker-container*** driver and supports strategies for building cross platform images:

### Enable qemu-user-static

![alt text](https://raw.githubusercontent.com/multiarch/dockerfile/master/logo.jpg)

**multiarch/qemu-user-static** is to enable an execution of different multi-architecture containers by QEMU and binfmt_misc. 

For more details:

https://github.com/multiarch/qemu-user-static#qemu-user-static

### Getting started
```$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes```


## Create a file test.sh 

```bash
#!/bin/sh

IMAGE_NAME=python-poc
export DOCKER_CLI_EXPERIMENTAL=enabled
build() {
	docker buildx build --platform linux/arm64 -t ${IMAGE_NAME} .
	docker save -o ~/Documents/buildroot/output/target/image_python_ARM.tar ${IMAGE_NAME}
}

build
```
1- Compress the image with **docker save**

2- Copy the image to ```~/Documents/buildroot/output/target/```

3- Flash image with the program ***balenaEtcher***

4- Decompress and load file.tar file to Raspberry Pi with this command ```docker load --input `image_python_ARM.tar```

5- Show all top level images, their repository and tags, and their size with ```docker images```

6- create a container from this last image with ```docker run ```

7- set  ```docker inspect``` 
to provide information about the image 


