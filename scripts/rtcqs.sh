#!/bin/bash
set -e

# Depende do pipx
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pipx.sh

# Instalação do rtcqs
sudo apt install python3-tk
pipx install rtcqs
sudo wget -cq --show-progress -O /usr/share/applications/rtcqs.desktop https://github.com/autostatic/rtcqs/raw/main/rtcqs.desktop
sudo wget -cq --show-progress -O /usr/share/icons/rtcqs.svg https://github.com/autostatic/rtcqs/raw/main/rtcqs_logo.svg

# CPU DMA latency
sudo wget -cq --show-progress -O /etc/udev/rules.d/99-cpu-dma-latency.rules https://raw.githubusercontent.com/Ardour/ardour/master/tools/udev/99-cpu-dma-latency.rules

# Audio group
sudo usermod -aG audio "$USER"

# GRUB
echo 'GRUB_CMDLINE_LINUX_DEFAULT="cpufreq.default_governor=performance mitigations=off preempt=full quiet splash threadirqs"'|sudo tee /etc/default/grub.d/cmdline-linux-default.cfg>/dev/null
sudo update-grub

# GVFS
sudo apt autoremove --purge gvfs-fuse

# Swappiness
echo 'vm.swappiness = 10'|sudo tee /etc/sysctl.d/swappiness.conf>/dev/null

# XDG portal
mkdir -p "$HOME"/.config/systemd/user
ln -fs /dev/null "$HOME"/.config/systemd/user/xdg-desktop-portal.service