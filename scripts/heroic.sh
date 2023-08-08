#!/bin/bash
set -e

# Instalação do Heroic Games Launcher
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install heroic