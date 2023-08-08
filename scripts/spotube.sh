#!/bin/bash
set -e

# Instalação do Spotube
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install libjsoncpp25 spotube