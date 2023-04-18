#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do agnoster
pkcon install git
mkdir -p "$HOME"/.bashrc.d/themes
rm -rf "$HOME"/.bashrc.d/themes/agnoster
git clone -q https://github.com/speedenator/agnoster-bash "$HOME"/.bashrc.d/themes/agnoster
cat <<EOF |tee "$HOME"/.bashrc.d/agnoster.bash>/dev/null
source "\$HOME"/.bashrc.d/themes/agnoster/agnoster.bash
EOF