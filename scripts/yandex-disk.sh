#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do Yandex Disk
sudo add-apt-repository ppa:slytomcat/ppa
pacstall -I yandex-disk-deb
pkcon install yd-tools
if [ -d /usr/share/icons/Papirus ];then
    if [ -f /usr/bin/convert ];then
        cat <<EOF |sudo tee /usr/share/yd-tools/fix-yandex-disk-indicator.sh>/dev/null
#!/bin/bash
set -e
sudo cp /usr/share/icons/Papirus/22x22/panel/yd-* /usr/share/yd-tools/icons/dark/
cd /usr/share/yd-tools/icons/dark/
for file in *.svg; do sudo convert -density 1200 -background none "\$file" "\${file%svg}png"; done
cd
sudo rm /usr/share/yd-tools/icons/dark/*.svg
sudo convert -density 1200 -background none -resize 128x128 /usr/share/icons/Papirus/128x128/apps/yd-128.svg /usr/share/yd-tools/icons/yd-128.png
sudo convert -density 1200 -background none -resize 128x128 /usr/share/icons/Papirus/22x22/panel/yd-ind-pause.svg /usr/share/yd-tools/icons/yd-128_g.png
sudo sed -i 's@Icon=/usr/share/yd-tools/icons/yd-128.png@Icon=yandex-disk@g' /usr/share/applications/Yandex.Disk-indicator.desktop
EOF
        bash /usr/share/yd-tools/fix-yandex-disk-indicator.sh
    fi
fi