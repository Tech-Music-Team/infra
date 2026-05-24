#!/bin/bash


#parando o container

docker stop web-application-container

#excluindo o container e a imagem
docker rm web-application-container
docker rmi infra-web-application

#Buildando nova imagem e rodando o container
docker build -t infra-web-application /home/ubuntu/web-application/

docker run -p 3333:3333 -d --name web-application-container  infra-web-application



