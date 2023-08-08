#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do bash line editor (ble.sh)
sudo apt install build-essential git
git clone -q --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX="$HOME"/.local>/dev/null
cat <<EOF |tee "$HOME"/.bashrc.d/blesh.bash>/dev/null
source "\$HOME"/.local/share/blesh/ble.sh
EOF
cat <<EOF |tee "$HOME"/.blerc>/dev/null
ble-face -s auto_complete fg=238,bg=000
bleopt complete_auto_delay=300
bleopt complete_requote_threshold=-1
EOF
rm -rf ble.sh*