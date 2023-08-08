#!/bin/bash
set -e

# Instalação do RustDesk
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install rustdesk

# Correção no ícone do lançador
cat <<EOF |sudo tee /etc/apt/apt.conf.d/100rustdesk-icon>/dev/null
DPkg::Post-Invoke {"sed -i 's@Icon=/usr/share/rustdesk/files/rustdesk.png@Icon=rustdesk@g' /usr/share/applications/rustdesk.desktop";};
EOF