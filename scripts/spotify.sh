#!/bin/bash
set -e

# Instalação do Spotify
wget -qO- https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg|sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo 'deb http://repository.spotify.com stable non-free'|sudo tee /etc/apt/sources.list.d/spotify.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
sudo apt install spotify-client