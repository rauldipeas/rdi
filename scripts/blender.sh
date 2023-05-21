#!/bin/bash
set -e

# Instalação do Blender
BLENDER_VER=$(wget -qO- https://ftp.nluug.nl/pub/graphics/blender/release|grep Blender3.|tail -n1|cut -d \" -f6)
BLENDER_FILE=$(wget -qO- https://ftp.nluug.nl/pub/graphics/blender/release/"$BLENDER_VER"|grep .tar.xz|tail -n1|cut -d \" -f6)
wget -c https://ftp.nluug.nl/pub/graphics/blender/release/"$BLENDER_VER""$BLENDER_FILE"
tar fx blender*.tar.xz
sudo mkdir -p /opt/blender
sudo chmod 777 /opt/blender
sudo mv blender*/* /opt/blender/
rm -r blender*/ blender*.tar.xz
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -sf /opt/blender/blender /usr/local/bin/blender
sudo cp /opt/blender/blender.desktop /usr/local/share/applications/blender.desktop
sudo ln -sf /opt/blender/blender.svg /usr/local/share/pixmaps/blender.svg