#!/bin/bash
set -e

# Download do pCloud
xdg-open 'https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64'

# Instalação do pCloud
chmod +x Downloads/pcloud
./Downloads/pcloud --appimage-extract
sudo cp -arf squashfs-root /opt/pcloud
sudo rm -rf squashfs-root
sudo chmod -Rf 755 /opt/pcloud

# Correção do ícone da área de notificação
sudo -E hardcode-tray --apply -ct RSVGConvert -o pcloud-drive

# Execução do programa para criação automática do lançador no início da sessão
/opt/pcloud/AppRun&