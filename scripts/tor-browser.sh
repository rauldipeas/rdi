#!/bin/bash
set -e

# Instalação do Tor
wget -cq --show-progress -O tor-browser-linux64-stable_ALL.tar.xz https://www.torproject.org"$(wget -qO- https://www.torproject.org/pt-BR/download/|grep linux64|head -n1|cut -d '"' -f4)"
tar fx tor-browser-linux64-stable_ALL.tar.xz
sudo mkdir -p /opt/tor-browser
sudo chmod 777 /opt/tor-browser
mv tor-browser/* /opt/tor-browser/
sudo mkdir -p /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/tor-browser/Browser/browser/chrome/icons/default/default128.png /usr/local/share/pixmaps/tor-browser.png
rm -rf tor-browser*
cat <<EOF |sudo tee /opt/tor-browser/Browser/defaults/pref/csd.js>/dev/null
pref("browser.tabs.inTitlebar", 1);
EOF
cat <<EOF |sudo tee /usr/local/share/applications/tor-browser.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Tor Browser
GenericName=Web Browser
Comment=Tor Browser  is +1 for privacy and −1 for mass surveillance
Categories=Network;WebBrowser;Security;
Exec=sh -c '"/opt/tor-browser/Browser/start-tor-browser" --detach || ([ !  -x "/opt/tor-browser/Browser/start-tor-browser" ] && "$(dirname "$*")"/Browser/start-tor-browser --detach)' dummy %k
X-TorBrowser-ExecShell=./Browser/start-tor-browser --detach
Icon=tor-browser
StartupWMClass=Tor Browser
EOF
cat <<EOF |sudo tee /etc/profile.d/mozilla-pixel-perfect-scrolling.sh
export MOZ_USE_XINPUT2=1
EOF