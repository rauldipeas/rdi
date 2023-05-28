#!/bin/bash
set -e

# Instalação do apx
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install apx docker.io
pacstall -I distrobox
sudo sed -i 's@share/apx@bin@g' /etc/apx/config.json

# Criação do container AUR
apx init --aur