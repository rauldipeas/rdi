#!/bin/bash
set -e

# Instalação do Hardcode tray
sudo add-apt-repository ppa:papirus/hardcode-tray
sed -i 's/jammy/focal/g' /etc/apt/sources.list.d/*hardcode-tray* #temp-fix
pkcon refresh
pkcon install hardcode-tray

# Correção dos ícones na área de notificação
sudo hardcode-tray --apply --theme Papirus-Dark