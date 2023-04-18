#!/bin/bash
set -e

# Instalação do top programming fonts
bash <(wget -qO- https://github.com/hbin/top-programming-fonts/raw/master/install.sh|sed 's/wget -c/wget -cq --show-progress/g')