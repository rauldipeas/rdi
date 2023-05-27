#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do apx
#pkcon install debhelper dh-golang golang-go
#git clone -q --recursive https://github.com/Vanilla-OS/apx.git
#cd apx
#make build
#dpkg-buildpackage -b -us -uc
#sudo apt autoremove --purge debhelper dh-golang golang-go
#pkcon install-local ./apx*.deb

bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install apx

#cat <<EOF |tee "$HOME"/.bashrc.d/apx.bash>/dev/null
#PATH="\$PATH":/usr/share/apx/bin
#EOF
#apx init --aur