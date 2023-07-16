#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do distrobox
wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install|sh -s -- --prefix ~/.distrobox
cat <<EOF |tee "$HOME"/.bashrc.d/distrobox.bash>/dev/null
export PATH="\$HOME/.distrobox/bin:\$PATH"
EOF
pkcon install podman

#cat <<EOF |sudo tee -a /etc/containers/registries.conf.d/shortnames.conf>/dev/null
#  # Archlinux
#  "archlinux" = "docker.io/library/archlinux"
#EOF

#distrobox-create --name 'archlinux' --image archlinux:latest

#distrobox enter archlinux
#pacman -S $1
#distrobox-export --app $1

#distrobox list
#distrobox stop archlinux
#distrobox rm archlinux
