#!/bin/bash
set -e

# Instalação do Firefox
wget -cq --show-progress -O firefox-latest-linux64-pt-br.tar.bz2 'https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR'
tar fjx firefox-latest-linux64-pt-br.tar.bz2
sudo mkdir -p /opt/firefox
sudo chmod 777 /opt/firefox
mv firefox/* /opt/firefox/
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/firefox/firefox /usr/local/bin/firefox
sudo ln -fs /opt/firefox/browser/chrome/icons/default/default128.png /usr/local/share/pixmaps/firefox.png
rm -rf firefox*
cat <<EOF |sudo tee /opt/firefox/defaults/pref/csd.js>/dev/null
pref("browser.tabs.inTitlebar", 1);
EOF
cat <<EOF |sudo tee /usr/local/share/applications/firefox.desktop>/dev/null
[Desktop Entry]
Version=1.0
Name=Firefox
Comment=Navegue na internet
GenericName=Navegador de internet
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true

Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=Abrir uma nova janela
Exec=firefox -new-window

[Desktop Action new-private-window]
Name=Abrir uma nova janela no modo privado
Exec=firefox -private-window
EOF