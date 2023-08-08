#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Depende do Distrobox
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bashrc.d/distrobox.sh

# Instalação do apx
sudo apt install docker.io
pacstall -I apx-git
sudo sed -i 's@share/apx@bin@g' /etc/apx/config.json

# Criação do container AUR
apx init --aur