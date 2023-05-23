#!/bin/bash
set -e

# Instalação do Mattermost
wget -qO- https://deb.packages.mattermost.com/pubkey.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mattermost.gpg
echo 'deb https://deb.packages.mattermost.com stable main'|sudo tee /etc/apt/sources.list.d/mattermost.list>/dev/null
pkcon refresh
pkcon install mattermost-desktop

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply --theme Papirus-Dark
    fi
fi