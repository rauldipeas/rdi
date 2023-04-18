#!/bin/bash
set -e

# Depende do pipx
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pipx.sh

# Instalação do konsave
if [ -f /usr/share/xsessions/plasma.desktop ]; then
  pipx install konsave
fi