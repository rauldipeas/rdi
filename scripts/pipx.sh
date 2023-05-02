#!/bin/bash
set -e

# Instalação do pipx
pkcon install pipx
sudo mkdir -p /opt/pipx/bin
sudo chmod 777 -R /opt/pipx
cat <<EOF |sudo tee /etc/X11/Xsession.d/99pipx
export PIPX_HOME='/opt/pipx'
export PIPX_BIN_DIR='/opt/pipx/bin'
export PATH="\$PATH:/opt/pipx/bin"
EOF