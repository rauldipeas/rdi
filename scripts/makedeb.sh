#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do MakeDeb
pacstall -I makedeb-deb
#export MAKEDEB_RELEASE='makedeb'
#bash <(wget -qO- https://shlink.makedeb.org/install)