#!/bin/bash
set -e

# Instalação do NextDNS
wget -qO- https://repo.nextdns.io/nextdns.gpg|sudo gpg --dearmor -o /etc/trusted.gpg.d/nextdns.gpg
echo 'deb https://repo.nextdns.io/deb stable main'|sudo tee /etc/apt/sources.list.d/nextdns.list
pkcon refresh
pkcon install nextdns