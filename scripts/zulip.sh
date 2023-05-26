#!/bin/bash
set -e

# Instalação do Zulip
wget -qO- https://download.zulip.com/desktop/apt/zulip-desktop.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/zulip-desktop.gpg
echo 'deb https://download.zulip.com/desktop/apt stable main'|sudo tee /etc/apt/sources.list.d/zulip-desktop.list>/dev/null
pkcon refresh
pkcon install zulip