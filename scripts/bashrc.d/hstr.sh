#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do hstr
sudo apt install hstr
cat <<EOF |tee "$HOME"/.bashrc.d/hstr.bash>/dev/null
lias hh=hstr
export HSTR_CONFIG=hicolor
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=\${HISTFILESIZE}
export PROMPT_COMMAND="history -a; history -n; \${PROMPT_COMMAND}"
if [[ \$- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
if [[ \$- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
EOF