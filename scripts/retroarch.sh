#!/bin/bash
set -e

# Instalação do EmulationStation
wget -q --show-progress -O emulationstation-de_x64.deb $(wget -qO- https://es-de.org|grep x64.deb|head -n1|cut -d '=' -f4|cut -d '>' -f1)
pkcon install-local emulationstation-de_x64.deb

# Instalação do tema EpicNoir para o EmulationStation
pkcon install git
mkdir -p "$HOME"/.emulationstation/themes
rm -rf "$HOME"/.emulationstation/themes/epicnoir
git clone -q https://github.com/dragoonDorise/es-theme-epicnoir "$HOME"/.emulationstation/themes/epicnoir

# Instalação do deb-get
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get

# Instalação do RetroArch
deb-get install retroarch

# Sugestão de núcleos para instalar
# fbneo
# flycast
# genesis-plus-gx
# mame2003-plus
# mame-current
# mupen64plus-next
# opera
# pcsx-rearmed
# pcsx2
# picodrive
# ppsspp
# snes9x
# virtualjaguar
# yabasanshiro