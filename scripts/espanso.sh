#!/bin/bash
set -e

# Instalação do Espanso
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install espanso
espanso service register
espanso start
espanso status