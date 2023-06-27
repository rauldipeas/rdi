#!/bin/bash
set -e

# Depende do MangoHUD
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/mangohud.sh

# Instalação da Steam
wget -cq --show-progress https://cdn.akamai.steamstatic.com/client/installer/steam.deb
pkcon install-local ./steam.deb
pkcon refresh
pkcon install steam-libs-amd64 steam-libs-i386

# Instalação do Steam Tinker Launch
pacstall -I steamtinkerlaunch-git

# Tema Adwaita para a Steam
#if [ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == \'adw-gtk3-dark\' ]; then
#if [ -f /usr/share/xsession/gnome.desktop ]
#    echo 'Ambiente gráfico GNOME detectado, instalando o tema Adwaita para a Steam.'
#    git clone https://github.com/tkashkin/Adwaita-for-Steam
#    mkdir -p /etc/skel/.local/share/Steam/skins
#    mv Adwaita-for-Steam/Adwaita "$HOME"/.local/share/Steam/skins/
#    else
#    echo 'Ambiente gráfico GNOME não detectado, o tema Adwaita para a Steam não será instalado.'
#fi