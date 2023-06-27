#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do MangoHud
wget -qc "$(wget -qO- https://api.github.com/repos/flightlessmango/MangoHud/releases|grep browser_download_url|grep download/v|grep tar.gz|head -n1|cut -d '"' -f4)"
tar fxz MangoHud*.tar.gz
cd MangoHud
./mangohud-setup.sh install
cd ..
rm -rf MangoHud MangoHud*.tar.gz
#pacstall -I mangohud