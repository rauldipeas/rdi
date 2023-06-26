#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do topgrade
pacstall -I topgrade-bin
#wget -q --show-progress "$(wget -qO- https://api.github.com/repos/topgrade-rs/topgrade/releases|grep browser_download_url|grep x86_64|grep linux-gnu|head -n1|cut -d '"' -f4)"
#tar fxz topgrade-*-x86_64-unknown-linux-gnu.tar.gz 
#sudo mv topgrade /usr/local/bin/