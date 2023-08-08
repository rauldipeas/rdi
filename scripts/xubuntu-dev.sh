#!/bin/bash
set -e

# Repositório de desenvolvimento do Xubuntu
if [ -f /usr/share/xsessions/xubuntu.desktop ]; then
    sudo add-apt-repository ppa:xubuntu-dev/staging
    sudo apt dist-upgrade
fi