#!/bin/bash
set -e

# Instalação do XanMod
wget -qO- https://dl.xanmod.org/archive.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/xanmod-archive-keyring.gpg
echo 'deb http://deb.xanmod.org releases main'|sudo tee /etc/apt/sources.list.d/xanmod-release.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
wget -cq --show-progress https://dl.xanmod.org/check_x86-64_psabi.sh
chmod +x check_x86-64_psabi.sh
sudo apt install linux-xanmod-x64"$(./check_x86-64_psabi.sh|cut -d '-' -f3)"
rm check_x86-64_psabi.sh