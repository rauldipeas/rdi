#!/bin/bash
set -e

# Instalação do Telegram
wget -cq --show-progress -O telegram.tar.xz $(wget -qO- https://api.github.com/repos/telegramdesktop/tdesktop/releases|grep browser_download_url|grep tar.xz|head -n1|cut -d '"' -f4)
tar fx telegram.tar.xz -C $HOME/.local/share/
rm telegram.tar.xz
$HOME/.local/share/Telegram/Telegram>/dev/null 2>&1&