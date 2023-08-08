#!/bin/bash
set -e

# Instalação do Visual Studio Code
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install code