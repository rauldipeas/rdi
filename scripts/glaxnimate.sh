#!/bin/bash
set -e

# Instalação do Glaxnimate
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install glaxnimate