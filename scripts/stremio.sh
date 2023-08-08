#!/bin/bash
set -e

# Instalação do Stremio
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install libssl-1.1 stremio