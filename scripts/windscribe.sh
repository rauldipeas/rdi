#!/bin/bash
set -e

# Instalação do Windscribe
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install windscribe