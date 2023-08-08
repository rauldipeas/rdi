#!/bin/bash
set -e

# Instalação do Mattermost
wget -qO- https://deb.packages.mattermost.com/pubkey.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mattermost.gpg
echo 'deb https://deb.packages.mattermost.com stable main'|sudo tee /etc/apt/sources.list.d/mattermost.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install mattermost-desktop

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply
    fi
fi