#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do mcfly
wget -cq --show-progress "$(wget -qO- https://api.github.com/repos/cantino/mcfly/releases|grep browser_download_url|grep download|grep x86_64|grep linux|head -n1|cut -d '"' -f4)"
sudo tar fxz mcfly-*-x86_64-*-linux-musl.tar.gz -C /usr/bin/
cat <<EOF |tee "$HOME"/.bashrc.d/mcfly.bash>/dev/null
#export MCFLY_LIGHT=TRUE
#export MCFLY_FUZZY=2
#export MCFLY_INTERFACE_VIEW=BOTTOM
#export MCFLY_DISABLE_MENU=TRUE
#export MCFLY_RESULTS_SORT=LAST_RUN
eval "\$(mcfly init bash)"
EOF