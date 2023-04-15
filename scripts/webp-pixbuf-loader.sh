#!/bin/bash
set -e

# Miniaturas de imagem webp no XFCE
sudo add-apt-repository ppa:helkaluin/webp-pixbuf-loader
pkcon install webp-pixbuf-loader
rm -rfv "$HOME"/.cache/thumbnails