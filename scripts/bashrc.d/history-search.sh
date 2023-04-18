#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação da pesquisa no histórico
cat <<EOF |tee "$HOME"/.bashrc.d/history-search.bash>/dev/null
if [[ \$- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
EOF