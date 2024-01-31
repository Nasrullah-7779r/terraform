#!/bin/bash

sudo apt update

sudo apt install nginx -y

sudo apt install docker.io -y

sudo docker login

sudo docker login -u nasrullahzafardae333 -p ${var.DOCKER_PASSWORD}

sudo docker pull nasrullahzafardae333/python_apps:latest 

sudo docker run -d -p 80:80 --name "container_python_app" nasrullahzafardae333/python_apps
