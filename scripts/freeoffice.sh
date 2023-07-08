#!/bin/bash
set -e

# Instalação do FreeOffice
wget -qO- https://shop.softmaker.com/repo/linux-repo-public.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/softmaker.gpg
echo 'deb https://shop.softmaker.com/repo/apt stable non-free'|sudo tee /etc/apt/sources.list.d/softmaker.list>/dev/null
pkcon refresh
pkcon install softmaker-freeoffice-2021