#!/bin/bash
set -e
# Instalação da Steam
wget -q --show-progress https://cdn.akamai.steamstatic.com/client/installer/steam.deb
pkcon install-local ./steam.deb

# Instalação do MangoHud
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/flightlessmango/MangoHud/releases|grep browser_download_url|grep tar.gz|head -n1|cut -d '"' -f4)"
tar fxz MangoHud*.tar.gz
cd MangoHud
./mangohud-setup.sh install
cd ..
rm -rf MangoHud*

# Instalação do Steam Tinker Launch
pacstall -I steamtinkerlaunch-git

# Tema Adwaita para a Steam
#if [ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == \'adw-gtk3-dark\' ]; then
if [ -f /usr/share/xsession/gnome.desktop ]
    echo 'Ambiente gráfico GNOME detectado, instalando o tema Adwaita para a Steam.'
    git clone https://github.com/tkashkin/Adwaita-for-Steam
    mkdir -p /etc/skel/.local/share/Steam/skins
    mv Adwaita-for-Steam/Adwaita "$HOME"/.local/share/Steam/skins/
    else
    echo 'Ambiente gráfico GNOME não detectado, o tema Adwaita para a Steam não será instalado.'
fi