#!/bin/bash
set -e

# Instalação do microbash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install micro
mkdir -p "$HOME"/.config/micro
cat <<EOF |tee "$HOME"/.config/micro/settings.json>/dev/null
{
	"eofnewline": false,
}
EOF