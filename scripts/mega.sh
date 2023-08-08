#!/bin/bash
set -e

# Instalação do MEGA
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install megasync
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi

# Integração com o gerenciador de arquivos
if [ -d /usr/share/applications/org.kde.dolphin.desktop ]; then
    sudo apt install dolphin-megasync
fi
if [ -d /usr/share/applications/nautilus.desktop ]; then
    sudo apt install nautilus-megasync
fi
if [ -d /usr/share/applications/nemo.desktop ]; then
    sudo apt install nemo-megasync
fi
if [ -d /usr/share/applications/thunar.desktop ]; then
    sudo apt install thunar-megasync
fi

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply
    fi
fi