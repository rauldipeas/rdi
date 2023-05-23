#!/bin/bash
set -e

# Instalação do ZeroTier
wget -qO- https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/zerotier.gpg
echo 'deb http://download.zerotier.com/debian/jammy jammy main'|sudo tee /etc/apt/sources.list.d/zerotier.list>/dev/null
pkcon install zerotier-one