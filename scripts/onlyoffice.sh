#!/bin/bash
set -e

# Instalação do OnlyOffice
sudo apt-key adv --output /etc/apt/trusted.gpg.d/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main'|sudo tee /etc/apt/sources.list.d/onlyoffice.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true|sudo debconf-set-selections
sudo apt install onlyoffice-desktopeditors
#wget -cq --show-progress https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
#sudo apt install-local ./onlyoffice-desktopeditors_amd64.deb