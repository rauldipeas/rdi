#!/bin/bash
set -e

# Instalação do Stremio
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install libssl-1.1 stremio