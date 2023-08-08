#!/bin/bash
set -e

# Instalação do JamesDSP
wget -qO- https://thepbone.github.io/PPA-Repository/KEY.gpg|sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/thepbone_ppa.gpg
echo 'deb [arch=amd64] https://thepbone.github.io/PPA-Repository ./'|sudo tee /etc/apt/sources.list.d/thepbone_ppa.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install jamesdsp-pulse

# Correção no ícone do lançador
cat <<EOF |sudo tee /etc/apt/apt.conf.d/100jamesdsp-icon>/dev/null
DPkg::Post-Invoke {"sed -i 's@Icon=/usr/share/pixmaps/jamesdsp.png@Icon=jamesdsp@g' /usr/share/applications/jamesdsp.desktop";};
EOF