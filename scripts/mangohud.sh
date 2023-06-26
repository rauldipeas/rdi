#!/bin/bash
set -e

# Instalação do MangoHud
pacstall -I mangohud
#wget -qc "$(wget -qO- https://api.github.com/repos/flightlessmango/MangoHud/releases|grep browser_download_url|grep download/v|grep tar.gz|head -n1|cut -d '"' -f4)"
#tar fxz MangoHud*.tar.gz
#cd MangoHud
#./mangohud-setup.sh install
#cd ..
#rm -rf MangoHud