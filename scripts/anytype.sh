#!/bin/bash
set -e

# Instalação do Anytype
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install anytype
sudo mv /usr/share/icons/hicolor/0x0/apps/anytype.png /usr/share/icons/hicolor/512x512/apps/ -v
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /usr/bin/rsvg-convert ]; then
        sudo rsvg-convert -f png /usr/share/icons/Papirus/24x24/panel/mynotes-tray.svg -o /opt/Anytype/resources/app.asar.unpacked/electron/img/iconTrayWhite.png 
    fi
fi