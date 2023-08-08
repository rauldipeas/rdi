#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do pipx
sudo apt install pipx
sudo mkdir -p /opt/pipx/bin
sudo chmod 777 -R /opt/pipx
cat <<EOF |sudo tee /etc/X11/Xsession.d/99pipx
export PIPX_HOME='/opt/pipx'
export PIPX_BIN_DIR='/opt/pipx/bin'
export PATH="\$PATH:/opt/pipx/bin"
EOF
cat <<EOF |tee "$HOME"/.bashrc.d/pipx.bash
eval "$(register-python-argcomplete3 pipx)"
EOF
