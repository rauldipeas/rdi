#!/bin/bash
set -e

# Configuração de arquitetura de pacotes
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt install libc6:armhf
sudo ln -s /lib/ld-linux-armhf.so.3 /lib/ld-linux.so.3
sudo apt install libstdc++6:armhf

# Instalação do Hamachi
wget -cq --show-progress https://www.vpn.net$(wget -qO- https://www.vpn.net/linux|grep armhf.deb|cut -d '"' -f6)
sudo apt install ./logmein-hamachi_*_armhf.deb
rm ./logmein-hamachi_*_armhf.deb

# Configuração do Hamachi
#sudo hamachi login
#sudo hamachi attach-net mail@domain.com