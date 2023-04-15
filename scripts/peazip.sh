#!/bin/bash
set -e

# Instalação do deb-get
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get

# Instalação do PeaZip
deb-get install peazip

# Configuração da integração com o ambiente gráfico para o KDE e XFCE
if [ -f /usr/share/applications/org.kde.dolphin.desktop ];then
    sudo cp /usr/share/peazip/batch/freedesktop_integration/KDE-servicemenus/KDE5-dolphin/*.desktop /usr/share/kservices5/ServiceMenus/
    elif [ -f /usr/share/applications/thunar.desktop ];then
    sudo cp /usr/share/peazip/batch/freedesktop_integration/*.desktop /usr/share/applications/
fi