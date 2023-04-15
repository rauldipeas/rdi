#!/bin/bash
set -e

# Instalação do Hamachi
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo add-apt-repository ppa:ztefn/haguichi-stable
pkcon install haguichi logmein-hamachi

# Configuração da permissão de execução
cat <<EOF |sudo tee /etc/polkit-1/localauthority/50-local.d/90-logmein-hamachi.pkla>/dev/null
[User permissions]
Identity=unix-user:$USER
Action=org.freedesktop.systemd1.manage-units
ResultActive=yes
EOF