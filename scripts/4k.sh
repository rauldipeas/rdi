#!/bin/bash
set -e

# Instalação do 4K
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install\
    4kvideodownloader\
    4ktokkit\
    4kstogram\
    4kyoutubetomp3\
    4kvideotomp3\
    4kslideshowmaker