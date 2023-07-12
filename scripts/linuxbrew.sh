#!/bin/bash
set -e

# Instalação do Linuxbrew
bash <(wget -qO- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

# Configuração para o bash
cat <<EOF |sudo tee /etc/X11/Xsession.d/99linuxbrew>/dev/null
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF