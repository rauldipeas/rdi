#!/bin/bash
set -e

# Instalação do Google Chrome
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install google-chrome

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply
    fi
fi