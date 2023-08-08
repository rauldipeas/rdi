#!/bin/bash
set -e

# Instalação do PipeWire
sudo add-apt-repository -n ppa:pipewire-debian/pipewire-upstream
sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream
sudo apt install\
    gstreamer1.0-pipewire\
    libpipewire-0.3-{0,dev,modules}\
    libpipewire-module-x11-bell\
    libspa-0.2-{bluetooth,dev,jack,modules}\
    libwireplumber-0.4-{0,dev}\
    pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}}\
    wireplumber{,-doc} gir1.2-wp-0.4
systemctl --user --now disable pulseaudio.{socket,service}
systemctl --user mask pulseaudio
sudo cp -vRa /usr/share/pipewire /etc/
systemctl --user --now enable\
    pipewire{,-pulse}.{socket,service}\
    filter-chain.service
pactl info|grep pulseaudio

# Desinstalação do PipeWire
#systemctl --user --now disable\
#    pipewire{,-pulse}.{socket,service}\
#    filter-chain.service
#systemctl --user unmask pulseaudio
#systemctl --user --now enable pulseaudio.{socket,service}
#sudo apt install ppa-purge
#sudo ppa-purge ppa:pipewire-debian/pipewire-upstream
#sudo ppa-purge ppa:pipewire-debian/wireplumber-upstream
#sudo rm -r /etc/pipewire
#pactl info|grep pulseaudio