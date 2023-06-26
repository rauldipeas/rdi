#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do MEGA
pacstall -I megasync-deb
pkcon refresh

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