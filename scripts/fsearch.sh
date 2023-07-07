#!/bin/bash
set -e

# Instalação do FSearch
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable
pkcon install fsearch

# Correção no ícone do lançador
cat <<EOF |sudo tee /etc/apt/apt.conf.d/100fsearch-icon>/dev/null
DPkg::Post-Invoke {"sed -i 's@Icon=io.github.cboxdoerfer.FSearch@Icon=preferences-system-search@g' /usr/share/applications/io.github.cboxdoerfer.FSearch.desktop";};
EOF