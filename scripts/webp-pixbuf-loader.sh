#!/bin/bash
set -e

# Miniaturas de imagem webp no XFCE
if [ -f /usr/share/xsessions/xubuntu.desktop ]; then
    sudo add-apt-repository ppa:helkaluin/webp-pixbuf-loader
    sudo apt install webp-pixbuf-loader
    rm -rf "$HOME"/.cache/thumbnails
fi