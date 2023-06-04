#!/bin/bash
set -e

# Instalação do MEGA
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install megasync

# Integração com o gerenciador de arquivos
if [ -d /usr/share/applications/org.kde.dolphin.desktop ]; then
    pkcon install dolphin-megasync
fi
if [ -d /usr/share/applications/nautilus.desktop ]; then
    pkcon install nautilus-megasync
fi
if [ -d /usr/share/applications/nemo.desktop ]; then
    pkcon install nemo-megasync
fi
if [ -d /usr/share/applications/thunar.desktop ]; then
    pkcon install thunar-megasync
fi

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply
    fi
fi