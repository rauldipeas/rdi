#!/bin/bash
set -e

# Instalação do Obsidian
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install obsidian