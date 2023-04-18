#!/bin/bash
set -e

# Adição do repositório do KXStudio
wget -cq --show-progress http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu/pool/main/k/kxstudio-repos/"$(wget -qO- http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu/pool/main/k/kxstudio-repos/|grep all.deb|tail -n1|cut -d '"' -f8)"
pkcon install-local ./kxstudio-repos*.deb
sudo add-apt-repository -ny multiverse
sudo add-apt-repository -y universe

# Instalação do WINE TkG
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install q4wine wine-tkg winetricks

# Instalação do WINEASIO
echo 'jackd2 jackd/tweak_rt_limits string true'|sudo debconf-set-selections
pkcon install alsa-firmware cadence wineasio

# Links das biblioecas para o WINE TkG
sudo ln -sv /usr/lib/i386-linux-gnu/wine/wineasio.dll /opt/wine-tkg/lib/wine/i386-windows/wineasio.dll
sudo ln -sv /usr/lib/i386-linux-gnu/wine/wineasio.dll.so /opt/wine-tkg/lib/wine/i386-unix/wineasio.dll.so
sudo ln -sv /usr/lib/x86_64-linux-gnu/wine/wineasio.dll /opt/wine-tkg/lib/wine/x86_64-windows/wineasio.dll
sudo ln -sv /usr/lib/x86_64-linux-gnu/wine/wineasio.dll.so /opt/wine-tkg/lib/wine/x86_64-unix/wineasio.dll.so

# Links opcionais no prefixo padrão do WINE
#cp /usr/lib/x86_64-linux-gnu/wine/wineasio.dll .wine/drive_c/windows/syswow64/ -v
#cp /usr/lib/i386-linux-gnu/wine/wineasio.dll .wine/drive_c/windows/system32/ -v

# Registro das bibliotecas
wine regsvr32 wineasio.dll
wine64 regsvr32 wineasio.dll