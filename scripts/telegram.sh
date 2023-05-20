#!/bin/bash
set -e

# Instalação do Telegram
wget -cq --show-progress -O telegram.tar.xz "$(wget -qO- https://api.github.com/repos/telegramdesktop/tdesktop/releases|grep browser_download_url|grep tar.xz|head -n1|cut -d '"' -f4)"
tar fx telegram.tar.xz
sudo mkdir -p /opt/Telegram
sudo chmod 777 /opt/Telegram
mv Telegram/* /opt/Telegram
rm -rf Telegram telegram.tar.xz
sudo mkdir -p /usr/local/bin /usr/local/share/applications
sudo ln -fs /opt/Telegram/Telegram /usr/local/bin/telegram
cat <<EOF |sudo tee /usr/local/share/applications/org.telegram.desktop._3e485da34fc040f9218e3891ecde1e6c.desktop>/dev/null
[Desktop Entry]
Name=Telegram Desktop
Comment=Official desktop version of Telegram messaging app
TryExec=/opt/Telegram/Telegram
Exec=/opt/Telegram/Telegram -- %u
Icon=telegram
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;
Actions=quit;
SingleMainWindow=true
X-GNOME-UsesNotifications=true
X-GNOME-SingleWindow=true

[Desktop Action quit]
Exec=/opt/Telegram/Telegram -quit
Name=Quit Telegram
Icon=application-exit
EOF