#!/bin/bash
set -e

# Instalação do Hamachi
sudo add-apt-repository -n ppa:ztefn/haguichi-stable
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install haguichi logmein-hamachi

# Configuração da permissão de execução
cat <<EOF |sudo tee /etc/polkit-1/localauthority/50-local.d/90-logmein-hamachi.pkla>/dev/null
[User permissions]
Identity=unix-user:$USER
Action=org.freedesktop.systemd1.manage-units
ResultActive=yes
EOF