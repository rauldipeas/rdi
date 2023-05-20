#!/bin/bash
set -e

# Instalação do Betterbird
wget -cq --show-progress -O betterbird-latest.pt-BR.linux-x86_64.tar.bz2 'https://www.betterbird.eu/downloads/get.php?os=linux&lang=pt-BR&version=release'
tar fjx betterbird-latest.pt-BR.linux-x86_64.tar.bz2
sudo mkdir -p /opt/betterbird
sudo chmod 777 /opt/betterbird
mv betterbird/* /opt/betterbird/
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/betterbird/betterbird /usr/local/bin/betterbird
sudo ln -fs /opt/betterbird/chrome/icons/default/default128.png /usr/local/share/pixmaps/betterbird.png
if [ -d /usr/share/icons/Papirus ];then
    rm /opt/betterbird/chrome/icons/default/newmail.svg
    ln -fs /usr/share/icons/Papirus/22x22/panel/indicator-messages-new.svg /opt/betterbird/chrome/icons/default/newmail.svg
fi
cat <<EOF |sudo tee /usr/local/share/applications/betterbird.desktop>/dev/null
[Desktop Entry]
Encoding=UTF-8
Name=Betterbird
Comment=Envie e receba e-mails com o Betterbird
GenericName=Cliente de e-mail
Keywords=Email;E-mail;Newsgroup;Feed;RSS
Exec=betterbird-kdocker %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=betterbird
Categories=Application;Network;Email;
MimeType=x-scheme-handler/mailto;application/x-xpinstall;
StartupNotify=true
Actions=Compose

[Desktop Action Compose]
Name=Compor uma nova mensagem
Exec=betterbird -compose
EOF

# KDocker
pkcon install kdocker
cat <<EOF |tee /opt/betterbird/betterbird-kdocker>/dev/null
#!/bin/bash
set -e
betterbird "\$@"&
if [ "\$(pgrep kdocker)" ];then
	killall -9 kdocker
	kdocker -i /usr/share/icons/Papirus/22x22/panel/indicator-notification-read.svg	-mq betterbird
	else
	kdocker -i /usr/share/icons/Papirus/22x22/panel/indicator-notification-read.svg	-mq betterbird
fi
EOF
sudo chmod +x /opt/betterbird/betterbird-kdocker
sudo ln -fs /opt/betterbird/betterbird-kdocker /usr/local/bin/betterbird-kdocker