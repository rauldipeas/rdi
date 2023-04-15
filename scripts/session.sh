#!/bin/bash
set -e

# Instalação do Sessions
wget -qO- https://deb.oxen.io/pub.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/oxen.gpg
echo "deb [arch=amd64] https://deb.oxen.io $(lsb_release -sc) main"|sudo tee /etc/apt/sources.list.d/oxen.list>/dev/null
pkcon refresh
pkcon install session-desktop