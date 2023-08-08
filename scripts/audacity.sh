#!/bin/bash
set -e

# Instalação do Audacity
sudo apt install audacity
mkdir -p "$HOME"/.audacity-data/Theme
wget -cO "$HOME"/.audacity-data/Theme/ImageCache.png https://github.com/visoart/audacity-themes/raw/master/themes/dark-blue/ImageCache.png

# Complemento para o Blender
#wget -c https://github.com/tin2tin/audacity_tools_for_blender/archive/main.zip
#mkdir -p "$HOME"/.config/blender/"$(find /opt/blender/* -type d|head -n1|sed "s@/opt/blender/@@g")"/scripts/addons/
#unzip audacity_tools_for_blender-main.zip -d "$HOME"/.config/blender/"$(find /opt/blender/* -type d|head -n1|sed "s@/opt/blender/@@g")"/scripts/addons/
#rm audacity_tools_for_blender-main.zip