#!/bin/bash
set -e

# Instalação do Mini video me
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install mini-video-me