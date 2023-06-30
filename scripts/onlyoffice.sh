#!/bin/bash
set -e

# Instalação do OnlyOffice
sudo apt-key adv --output /etc/apt/trusted.gpg.d/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main'|sudo tee /etc/apt/sources.list.d/onlyoffice.list>/dev/null
pkcon refresh
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true|sudo debconf-set-selections
pkcon install onlyoffice-desktopeditors
#wget -cq --show-progress https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
#pkcon install-local ./onlyoffice-desktopeditors_amd64.deb