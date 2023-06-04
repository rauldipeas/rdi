#!/bin/bash
set -e

# Instalação do Sessions
wget -qO- https://deb.oxen.io/pub.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/oxen.gpg
echo "deb [arch=amd64] https://deb.oxen.io $(lsb_release -sc) main"|sudo tee /etc/apt/sources.list.d/oxen.list>/dev/null
pkcon refresh
pkcon install session-desktop

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/hardcode-tray ]; then
        sudo hardcode-tray --apply
    fi
fi