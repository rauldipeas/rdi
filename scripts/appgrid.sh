#!/bin/bash
set -e

# Instalação do App Grid
wget -cq --show-progress "$(wget -qO- https://www.appgrid.org|grep deb|cut -d "'" -f4)"
sudo apt install-local ./appgrid*.deb