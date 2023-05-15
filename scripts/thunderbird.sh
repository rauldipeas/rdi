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

# Instalação do Birdtray
wget -q --show-progress https://ppa.launchpadcontent.net/linuxuprising/ppa/ubuntu/pool/main/b/birdtray/$(wget -qO- https://ppa.launchpadcontent.net/linuxuprising/ppa/ubuntu/pool/main/b/birdtray/|grep jammy|grep amd64.deb|cut -d '"' -f8|tail -n1)
dpkg-deb -x birdtray*.deb birdtray
sudo cp birdtray/usr/bin/birdtray /opt/thunderbird/
sudo ln -fs /opt/thunderbird/birdtray /usr/local/bin/birdtray
sudo cp birdtray/usr/share/applications/com.ulduzsoft.Birdtray.desktop /usr/local/share/applications/
sudo cp -r birdtray/usr/share/icons /usr/loca/share/
sudo cp -r birdtray/usr/share/ulduzsoft /usr/local/share/
wget -q --show-progress -O "$HOME"/.config/birdtray-config.json https://raw.githubusercontent.com/rauldipeas/respin-rdx/main/assets/birdtray/birdtray-config.json