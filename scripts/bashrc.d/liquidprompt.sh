#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do liquidprompt
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install liquidprompt
cp /usr/share/liquidprompt/liquidpromptrc-dist .config/liquidpromptrc
sed -i 's/debian.theme/powerline.theme/g' "$HOME"/.config/liquidpromptrc
cat <<EOF |tee "$HOME"/.bashrc.d/liquidprompt.bash>/dev/null
echo \$-|grep -q i 2>/dev/null&&. /usr/share/liquidprompt/liquidprompt
lp_theme powerline
EOF