#!/bin/bash
set -e

# Instalação do AMD GPU top
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install amdgpu-top
echo 'Icon=radeon-profile'|sudo tee -a /usr/share/applications/amdgpu_top.desktop