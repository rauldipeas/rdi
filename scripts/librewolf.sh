#!/bin/bash
set -e

# Instalação do LibreWolf
distro=$(
    if echo 'una vanessa focal jammy bullseye vera uma'|grep -q "$(lsb_release -sc)";then
        echo "$(lsb_release -sc)"
        else
        echo focal
    fi
)
wget -qO- https://deb.librewolf.net/keyring.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/librewolf.gpg
cat <<EOF |sudo tee /etc/apt/sources.list.d/librewolf.sources>/dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /etc/apt/trusted.gpg.d/librewolf.gpg
EOF
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install librewolf
cat <<EOF |sudo tee /etc/profile.d/mozilla-pixel-perfect-scrolling.sh>/dev/null
export MOZ_USE_XINPUT2=1
EOF