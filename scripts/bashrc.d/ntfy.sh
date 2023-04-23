#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Depende do pipx
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pipx.sh

# Instalação do ntfy
pkcon install libnotify-bin pipx
pipx install --system-site-packages ntfy
cat <<EOF |tee "$HOME"/.bashrc.d/ntfy.bash>/dev/null
PATH="\$PATH":"\$HOME"/.local/bin
eval "\$(ntfy shell-integration)"
EOF