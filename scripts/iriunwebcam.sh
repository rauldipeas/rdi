#!/bin/bash
set -e

# Instalação do deb-get
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get

# Instalação do GCC 12
pkcon install gcc-12
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 11

# Instalação do v4l2loopback-dkms
wget -qc --show-progress http://mirrors.kernel.org/ubuntu/pool/universe/v/v4l2loopback/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/universe/v/v4l2loopback/|grep v4l2loopback-dkms|grep .deb|tail -n4|head -n1|cut -d '"' -f2)
pkcon install-local ./v4l2loopback-dkms*.deb

# Instalação do Iriun Webcam
deb-get install iriunwebcam

# Correção no ícone do lançador
cat <<EOF| sudo tee /etc/apt/apt.conf.d/100iriunwebcam-icon>/dev/null
DPkg::Post-Invoke {"sed -i 's/Icon=iriunwebcam/Icon=webcamoid/g' /usr/share/applications/iriunwebcam.desktop";};
EOF