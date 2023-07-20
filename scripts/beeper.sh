#!/bin/bash
set -e

# Depende do LinuxBrew
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bashrc.d/linuxbrew.sh

# Instalação do Beeper
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install beeper

# Correção dos ícones na área de notificação
if [ -d /usr/share/icons/Papirus ]; then
    if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
        brew install npm
        if [ -f /home/linuxbrew/.linuxbrew/bin/npx ]; then
            npx asar e /opt/beeper/resources/webapp.asar beeper-asar
            if [ -f /usr/bin/rsvg-convert ]; then
                rsvg-convert -f png /usr/share/icons/Papirus/24x24/panel/messenger-indicator.svg -o beeper-asar/vector-icons/favicon.*.png
                npx asar p beeper-asar webapp.asar
                sudo cp -rf webapp.asar /opt/beeper/resources/
                sudo rsvg-convert -f png -h 256 -w 256 /usr/share/icons/Papirus/24x24/panel/messenger-indicator.svg -o /opt/beeper/resources/icons/icon.png
                rm -rf beeper-asar webapp.asar
            fi
        fi
    fi
fi