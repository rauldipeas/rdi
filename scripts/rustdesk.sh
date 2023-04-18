#!/bin/bash
set -e

# Instalação do deb-get
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get

# Instalação do RustDesk
deb-get install rustdesk