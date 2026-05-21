#!/bin/bash

REPO_NGINX="https://github.com/Tech-Music-Team/nginx-proxy"
REPO_DATABASE="https://github.com/Tech-Music-Team/database"
REPO_WEB="https://github.com/Tech-Music-Team/web-aplication"
REPO_JAVA="https://github.com/Tech-Music-Team/java-application"

PROJECT_DIR="/home/ubuntu"

echo "Iniciando instalacao"

# Atualiza pacotes
sudo apt update && sudo apt upgrade -y

# Docker
command -v docker &>/dev/null
if [ $? = 0 ]; then
    echo "Docker ja instalado"
else
    echo "Instalando Docker..."
    curl -fsSL https://get.docker.com | sudo sh
    sudo usermod -aG docker "$USER"
    echo "Docker instalado."
fi

# Docker Compose
command -v docker-compose &>/dev/null
if [ $? = 0 ]; then
    echo "Docker Compose ja instalado"
else
    echo "Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose instalado."
fi

# Repositorios
echo "Clonando repositorios..."
cd "$PROJECT_DIR"
git clone "$REPO_NGINX"
git clone "$REPO_DATABASE"
git clone "$REPO_WEB"
git clone "$REPO_JAVA"

echo "Concluido."
