#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do atuin
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install atuin
wget -qO- "$HOME"/.bashrc.d/bash-preexec.sh https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh
cat <<EOF |tee "$HOME"/.bashrc.d/atuin.bash>/dev/null
[[ -f ~/.bashrc.d/bash-preexec.sh ]] && source ~/.bashrc.d/bash-preexec.sh
eval "\$(atuin init bash --disable-up-arrow)"
EOF