#!/bin/bash
set -e

# Instalação do Authy
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install authy