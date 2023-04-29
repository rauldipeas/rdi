#!/bin/bash
set -e

# Instalação do pCloud
if [ -f "$HOME"/Downloads/pcloud ];then
    chmod +x Downloads/pcloud
    ./Downloads/pcloud --appimage-extract
    sudo cp -arf squashfs-root /opt/pcloud
    sudo rm -rf squashfs-root
    sudo chmod -Rf 755 /opt/pcloud
    # Correção dos ícones na área de notificação
    if [ -d /usr/share/icons/Papirus ]; then
        if [ -f /usr/bin/hardcode-tray ]; then
            sudo -E hardcode-tray --apply -ct RSVGConvert -o pcloud-drive
        fi
    fi
    # Execução do programa para criação automática do lançador no início da sessão
    /opt/pcloud/AppRun&
    else
    # Download do pCloud
    xdg-open 'https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64'
fi