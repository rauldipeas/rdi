#!/bin/bash
set -e

# Instalação do Linuxbrew
bash <(wget -qO- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

# Configuração para o bash
cat <<EOF |tee "$HOME"/.bashrc.d/linuxbrew.bash
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF