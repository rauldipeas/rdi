#!/bin/bash
set -e

# Instalação do PeaZip
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install peazip

# Configuração da integração com o ambiente gráfico para o KDE e XFCE
if [ -f /usr/share/applications/org.kde.dolphin.desktop ];then
    sudo cp /usr/share/peazip/batch/freedesktop_integration/KDE-servicemenus/KDE5-dolphin/*.desktop /usr/share/kservices5/ServiceMenus/
    elif [ -f /usr/share/applications/thunar.desktop ];then
    sudo cp /usr/share/peazip/batch/freedesktop_integration/*.desktop /usr/share/applications/
fi