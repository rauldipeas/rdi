#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do ambiente SSH
sudo apt install --no-install-recommends dropbear
sudo apt install openssh-sftp-server
cat <<EOF |tee "$HOME"/.bashrc.d/ssh-environment.bash>/dev/null
export DISPLAY=:0
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
EOF