#!/bin/bash
set -e

# Instalação do Hardcode tray
if [ -d /usr/share/icons/Papirus ]; then
    sudo add-apt-repository -n ppa:papirus/hardcode-tray
    sed -i 's/jammy/focal/g' /etc/apt/sources.list.d/*hardcode-tray* #temp-fix
    if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
    sudo apt install hardcode-tray
 
    # Correção dos ícones na área de notificação
    sudo hardcode-tray --apply
    else
    bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/rdi/main/rdi.sh) papirus
    bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/rdi/main/rdi.sh) hardcode-tray
fi