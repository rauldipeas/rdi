#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do apx
pkcon install docker.io
pacstall -I apx-git
pacstall -I distrobox
sudo sed -i 's@share/apx@bin@g' /etc/apx/config.json

# Criação do container AUR
apx init --aur