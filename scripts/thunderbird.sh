#!/bin/bash
set -e

# Instalação do Thunderbird
wget -q --show-progress -O thunderbird-latest-linux64-pt-br.tar.bz2 "https://download.mozilla.org/?product=thunderbird-latest&os=linux64&lang=pt-BR"
tar fjx thunderbird-latest-linux64-pt-br.tar.bz2
sudo mkdir -p /opt/thunderbird
sudo chmod 777 /opt/thunderbird
mv thunderbird/* /opt/thunderbird/
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
sudo ln -fs /opt/thunderbird/chrome/icons/default/default128.png /usr/local/share/pixmaps/thunderbird.png
cat <<EOF |sudo tee /usr/local/share/applications/thunderbird.desktop>/dev/null
[Desktop Entry]
Encoding=UTF-8
Name=Thunderbird
Comment=Envie e receba e-mails com o Thunderbird
GenericName=Cliente de e-mail
Keywords=Email;E-mail;Newsgroup;Feed;RSS
Exec=thunderbird %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=thunderbird
Categories=Application;Network;Email;
MimeType=x-scheme-handler/mailto;application/x-xpinstall;
StartupNotify=true
Actions=Compose;Contacts

[Desktop Action Compose]
Name=Compor uma nova mensagem
Exec=thunderbird -compose

[Desktop Action Contacts]
Name=Contatos
Exec=thunderbird -addressbook
EOF