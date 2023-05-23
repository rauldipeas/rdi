#!/bin/bash
set -e

# Instalação do SyncThing
wget -qO- https://syncthing.net/release-key.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/syncthing-archive-keyring.gpg
echo 'deb https://apt.syncthing.net/ syncthing stable'|sudo tee /etc/apt/sources.list.d/syncthing.list>/dev/null
pkcon refresh
pkcon install syncthing