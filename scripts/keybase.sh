#!bin/bash
set -e

# Instalação do Keybase
wget -qO- https://keybase.io/docs/server_security/code_signing_key.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/keybase-keyring.gpg
echo 'deb http://prerelease.keybase.io/deb stable main'|sudo tee /etc/apt/sources.list.d/keybase.list>/dev/null
pkcon update
pkcon install inotify-tools keybase
mkdir -p "$HOME"/Sync "$HOME"/.config/autostart
cat <<EOF |sudo tee /usr/local/bin/keybase-rsync
#!/bin/bash
set -e
rsync -rvz --delete $HOME/Sync /keybase/private/$USER
while inotifywait -r -e modify,create,delete,move $HOME/Sync; do
    rsync -rvz --delete $HOME/Sync /keybase/private/$USER
done
EOF
sudo chmod +x /usr/local/bin/keybase-rsync
cat <<EOF |tee "$HOME"/.config/autostart/keybase-rsync.desktop
[Desktop Entry]
Name=Keybase Rsync
Type=Application
Exec=keybase-rsync
EOF