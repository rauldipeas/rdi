#!/bin/bash
set -e

# Instalação do Brave
wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
echo 'deb https://brave-browser-apt-release.s3.brave.com/ stable main'|sudo tee /etc/apt/sources.list.d/brave-browser-release.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install brave-browser