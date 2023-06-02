#!bin/bash
set -e

# Instalação do Keybase
wget -qO- https://keybase.io/docs/server_security/code_signing_key.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/keybase-keyring.gpg
echo 'deb http://prerelease.keybase.io/deb stable main'|sudo tee /etc/apt/sources.list.d/keybase.list>/dev/null
pkcon update
pkcon install keybase
#ln -sv /keybase/private/"$USER" "$HOME"/Keybase