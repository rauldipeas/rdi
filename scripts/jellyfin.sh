#!/bin/bash
set -e

# Instalação do Jellyfin
DISTRO="$(awk -F'=' '/^ID=/{ print $NF }' /etc/os-release)"
CODENAME="$(awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release)"
wget -qO- --show-progress https://repo.jellyfin.org/"${DISTRO}"/jellyfin_team.gpg.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/jellyfin.gpg
cat <<EOF |sudo tee /etc/apt/sources.list.d/jellyfin.sources
Types: deb
URIs: https://repo.jellyfin.org/${DISTRO}
Suites: ${CODENAME}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/trusted.gpg.d/jellyfin.gpg
EOF
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install jellyfin
sudo systemctl enable jellyfin.service
sudo systemctl start jellyfin.service