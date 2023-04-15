#!/bin/bash
set -e

# Instalação do MakeDeb
export MAKEDEB_RELEASE='makedeb'
bash <(wget -qO- https://shlink.makedeb.org/install)