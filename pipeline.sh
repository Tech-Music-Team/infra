#!/bin/bash


#parando o container

docker stop web-application-container

#excluindo o container e a imagem
sudo docker rm web-application-container
sudo docker rmi infra-web-application

#Buildando nova imagem e rodando o container
cd /home/ubuntu/web-application
git pull

sudo docker build -t infra-web-application .

sudo docker run -p 3333:3333 -d --name web-application-container  infra-web-application



