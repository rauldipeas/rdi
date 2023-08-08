#!/bin/bash
set -e

# Instalação do REAPER
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install cockos-reaper
mkdir -p "$HOME"/.config/REAPER/{ColorThemes,LangPack,UserPlugins}
wget -q --show-progress -O "$HOME"/.config/REAPER/ColorThemes/Default_6.0.ReaperThemeZip https://stash.reaper.fm/40797/Mammoth.ReaperThemeZip
wget -q --show-progress -O "$HOME"/.config/REAPER/LangPack/pt-BR.ReaperLangPack https://stash.reaper.fm"$(wget -qO- https://stash.reaper.fm/tag/Language-Packs|grep '/pt-BR.ReaperLangPack'|tail -n1|cut -d '"' -f2|sed 's/\/v//g')"
wget -q --show-progress https://sws-extension.org/download/pre-release/"$(wget -qO- http://sws-extension.org/download/pre-release/|grep Linux-x86_64|head -n1|cut -d '"' -f4)"
tar fx sws-*-Linux-x86_64-*.tar.xz -C "$HOME"/.config/REAPER
wget -q --show-progress -O "$HOME"/.config/REAPER/UserPlugins/reaper_reapack-x86_64.so "$(wget -qO- https://api.github.com/repos/cfillion/reapack/releases|grep browser_download_url|grep download/v|grep x86_64.so|head -n1|cut -d '"' -f4)"