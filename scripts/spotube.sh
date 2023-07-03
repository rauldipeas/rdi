#!/bin/bash
set -e

# Instalação do Spotube
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install libjsoncpp25 spotube