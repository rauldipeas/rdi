#!/bin/bash
set -e

# Instalação do EmulationStation
wget -cq --show-progress -O emulationstation-de_x64.deb "$(wget -qO- https://es-de.org|grep x64.deb|head -n1|cut -d '=' -f4|cut -d '>' -f1)"
sudo apt install-local emulationstation-de_x64.deb

# Instalação do tema EpicNoir para o EmulationStation
sudo apt install git
mkdir -p "$HOME"/.emulationstation/themes
rm -rf "$HOME"/.emulationstation/themes/epicnoir
git clone -q https://github.com/dragoonDorise/es-theme-epicnoir "$HOME"/.emulationstation/themes/epicnoir

# Instalação do RetroArch
sudo add-apt-repository ppa:libretro/stable
sudo apt install retroarch

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