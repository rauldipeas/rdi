#!/bin/bash
set -e

# Depende do pipx
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bashrc.d/pipx.sh

# Instalação do SpotDL
pipx install spotdl

# Lançador para o SpotDL
sudo mkdir -p /usr/local/share/applications
cat <<EOF |sudo tee /usr/local/share/applications/spotdl.desktop
[Desktop Entry]
Type=Application
Name=SpotDL
Icon=wihotspot
NoDisplay=false
Exec=spotdl
Terminal=false
X-GNOME-UsesNotifications=true
EOF