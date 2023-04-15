#!/bin/bash
set -e

# Instalação do tema de ícones Papirus
sudo add-apt-repository ppa:papirus/papirus-dev
pkcon install papirus-icon-theme papirus-folders

# Configuração opcional de cor para as pastas
#sudo papirus-folders -C cyan #KDE
#sudo papirus-folders -C paleorange # XFCE

# Tema Papirus para o LibreOffice
wget -cq --show-progress https://launchpad.net/~papirus/+archive/ubuntu/papirus/+files/libreoffice-style-papirus_20180413-46+pkg3~ubuntu20.04.1_all.deb
pkcon install-local ./libreoffice-style-papirus_20180413-46+pkg3~ubuntu20.04.1_all.deb