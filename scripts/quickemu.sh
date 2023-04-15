#!/bin/bash
set -e

# Instalação do Quickemu
sudo apt-add-repository -n ppa:flexiondotorg/quickemu
sudo add-apt-repository ppa:yannick-mauray/quickgui
pkcon install quickemu quickgui