#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do Touchegg
#sudo add-apt-repository -n ppa:touchegg/stable
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install touche
pacstall -I touchegg-git

#wget -cq --show-progress "$(wget -qO- https://ppa.launchpadcontent.net/touchegg/stable/ubuntu/pool/main/t/touchegg/|grep 22.04|grep amd64.deb|tail -n1|cut -d '"' -f8)" #tmp-fix
#pkcon install-local ./touchegg*.deb