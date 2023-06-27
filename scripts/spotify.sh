#!/bin/bash
set -e

# Instalação do Spotify
wget -qO- https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg|sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo 'deb http://repository.spotify.com stable non-free'|sudo tee /etc/apt/sources.list.d/spotify.list>/dev/null
pkcon refresh
pkcon install spotify-client