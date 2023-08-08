#!/bin/bash
set -e

# Instalação do JetBrains
wget -qO- https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/jetbrains-ppa-archive-keyring.gpg
echo 'deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main'|sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list>/dev/null
if [ -f /usr/bin/nala ];then
    sudo nala update
    else
    sudo apt update
fi
#sudo apt install\
#    clion\
#    datagrip\
#    dataspell\
#    goland\
#    intelij-idea-community\
#    intelij-idea-ultimate\
#    jetbrains-gateway\
#    phpstorm\
#    pycharm-community\
#    pycharm-education\
#    pycharm-profressional\
#    rider\
#    rubymine\
#    webstorm
