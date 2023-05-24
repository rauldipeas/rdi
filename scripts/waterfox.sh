#!/bin/bash
set -e

# Instalação do Waterfox
wget -cq --show-progress -O waterfox-latest-linux64-en-us.tar.bz2 "$(wget -qO- https://www.waterfox.net/download/|grep tar.bz2|cut -d '"' -f508)"
tar fjx waterfox-latest-linux64-en-us.tar.bz2
sudo mkdir -p /opt/waterfox
sudo chmod 777 /opt/waterfox
mv waterfox/* /opt/waterfox/
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/waterfox/waterfox /usr/local/bin/waterfox
sudo ln -fs /opt/waterfox/browser/chrome/icons/default/default128.png /usr/local/share/pixmaps/waterfox.png
rm -rf waterfox*
cat <<EOF |sudo tee /opt/waterfox/defaults/pref/csd.js>/dev/null
pref("browser.tabs.inTitlebar", 1);
EOF
cat <<EOF |sudo tee /usr/local/share/applications/waterfox.desktop>/dev/null
[Desktop Entry]
Version=1.0
Name=Waterfox
Comment=Navegue na internet
GenericName=Navegador de internet
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=waterfox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=waterfox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true

Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=Abrir uma nova janela
Exec=waterfox -new-window

[Desktop Action new-private-window]
Name=Abrir uma nova janela no modo privado
Exec=waterfox -private-window
EOF