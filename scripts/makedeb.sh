#!/bin/bash
set -e

# Instalação do MakeDeb
export MAKEDEB_RELEASE='makedeb'
bash <(wget -qO- https://shlink.makedeb.org/install)

# Instalação do MPR
wget -qO- https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub|gpg --dearmor -o /etc/apt/trusted.gpg.d/prebuilt-mpr-archive-keyring.gpg
echo "deb [arch=amd64] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)"|sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
#sudo apt install mist
#mist update