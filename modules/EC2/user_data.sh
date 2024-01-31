#!/bin/bash

sudo apt update

sudo apt install nginx -y

sudo apt install docker.io -y

sudo docker login

sudo docker login -u ${var.DOCKER_ACCOUNT_ID} -p ${var.DOCKER_PASSWORD}

sudo docker pull ${var.DOCKER_ACCOUNT_ID}/python_apps:latest 

sudo docker run -d -p 80:80 --name "container_python_app" ${var.DOCKER_ACCOUNT_ID}/python_apps
