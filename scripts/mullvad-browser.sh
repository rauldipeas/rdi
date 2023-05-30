#!/bin/bash
set -e

# Instalação do Mullvad
wget -cq --show-progress -O mullvad-browser-linux64-stable_ALL.tar.xz https://mullvad.net/en/download/browser/linux64/latest
tar fx mullvad-browser-linux64-stable_ALL.tar.xz
sudo mkdir -p /opt/mullvad-browser
sudo chmod 777 /opt/mullvad-browser
mv mullvad-browser/* /opt/mullvad-browser/
sudo mkdir -p /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/mullvad-browser/Browser/browser/chrome/icons/default/default128.png /usr/local/share/pixmaps/mullvad-browser.png
rm -rf mullvad-browser*
cat <<EOF |sudo tee /opt/mullvad-browser/Browser/defaults/pref/csd.js>/dev/null
pref("browser.tabs.inTitlebar", 1);
EOF
cat <<EOF |sudo tee /usr/local/share/applications/mullvad-browser.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Mullvad Browser
GenericName=Web Browser
Comment=Mullvad Browser  is +1 for privacy and −1 for mass surveillance
Categories=Network;WebBrowser;Security;
Exec=sh -c '"/opt/mullvad-browser/Browser/start-mullvad-browser" --detach || ([ !  -x "/opt/mullvad-browser/Browser/start-mullvad-browser" ] && "$(dirname "$*")"/Browser/start-mullvad-browser --detach)' dummy %k
X-MullvadBrowser-ExecShell=./Browser/start-mullvad-browser --detach
Icon=mullvad-browser
StartupWMClass=Mullvad Browser
EOF
cat <<EOF |sudo tee /etc/profile.d/mozilla-pixel-perfect-scrolling.sh
export MOZ_USE_XINPUT2=1
EOF