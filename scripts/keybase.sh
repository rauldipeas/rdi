#!bin/bash
set -e

# Instalação do Keybase
wget -qO- https://keybase.io/docs/server_security/code_signing_key.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/keybase-keyring.gpg
echo 'deb http://prerelease.keybase.io/deb stable main'|sudo tee /etc/apt/sources.list.d/keybase.list>/dev/null
pkcon refresh
pkcon install keybase #inotify-tools
#mkdir -p "$HOME"/Sync
#cat <<EOF |sudo tee /usr/local/bin/keybase-rsync>/dev/null
##!/bin/bash
#set -e
#sleep 60
#if [ "\$(pgrep -l keybase|cut -d ' ' -f2|grep -v keybase-rsync|head -n1)" == keybase ];then
#    notify-send -u low -a 'Keybase' -i /usr/share/icons/Papirus/64x64/apps/keybase.svg 'Keybase em execução'
#    if [ -d /keybase/private/"\$(ls /keybase/private)" ];then
#        notify-send -u low -a 'Keybase' -i /usr/share/icons/Papirus/64x64/apps/keybase.svg 'Sincronizando arquivos...'
#        rsync -rz --delete "\$HOME"/Sync/ /keybase/private/"\$(ls /keybase/private)"
#        while inotifywait -r -e modify,create,delete,move "\$HOME"/Sync; do
#            notify-send -u low -a 'Keybase' -i /usr/share/icons/Papirus/64x64/apps/keybase.svg 'Sincronizando arquivos...'
#            rsync -rz --delete "\$HOME"/Sync/ /keybase/private/"\$(ls /keybase/private)"
#        done
#        else
#        notify-send -u low -a 'Keybase' -i /usr/share/icons/Papirus/64x64/apps/keybase.svg 'Usuário do Keybase não identificado'
#    fi
#    else
#    notify-send -u low -a 'Keybase' -i /usr/share/icons/Papirus/64x64/apps/keybase.svg 'Keybase não iniciado'
#fi
#EOF
#sudo chmod +x /usr/local/bin/keybase-rsync
#cat <<EOF |sudo tee /etc/xdg/autostart/keybase-rsync.desktop
#[Desktop Entry]
#Name=Keybase Rsync
#Type=Application
#Exec=keybase-rsync
#Icon=keybase-update
#EOF