#!/bin/bash
set -e

# Instalação do Ulaa
wget -qO- https://ulaa.zoho.com/release/linux/stable/pubkey|gpg --dearmor -o /etc/apt/trusted.gpg.d/ulaa-browser-release.gpg
echo 'deb https://ulaa.zoho.com/release/linux/stable /'|sudo tee /etc/apt/sources.list.d/ulaa-browser-release.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install ulaa-browser
