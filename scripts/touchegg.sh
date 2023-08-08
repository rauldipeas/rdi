#!/bin/bash
set -e

# Instalação do Touchegg
sudo add-apt-repository -n ppa:touchegg/stable
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install touche touchegg
#wget -cq --show-progress "$(wget -qO- https://ppa.launchpadcontent.net/touchegg/stable/ubuntu/pool/main/t/touchegg/|grep 22.04|grep amd64.deb|tail -n1|cut -d '"' -f8)" #tmp-fix
#sudo apt install ./touchegg*.deb