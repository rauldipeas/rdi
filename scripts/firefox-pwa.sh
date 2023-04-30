#!/bin/bash
set -e

# Instalação do Firefox PWA
wget -qO- https://packagecloud.io/filips/FirefoxPWA/gpgkey|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/firefoxpwa-keyring.gpg>/dev/null
echo 'deb https://packagecloud.io/filips/FirefoxPWA/any any main'|sudo tee /etc/apt/sources.list.d/firefoxpwa.list>/dev/null
pkcon refresh
sudo apt install --no-install-recommends firefoxpwa