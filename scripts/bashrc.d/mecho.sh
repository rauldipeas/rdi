#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do mecho
cat <<EOF |tee "$HOME"/.bashrc.d/mecho.bash>/dev/null
mecho() {
  colors=(black red green yellow blue purple cyan white)
  effects=(reset bold dim italic underline blink rblink reverse)
  M=$1; M=${M//\[\/\]/\[reset\]}
  for i in "${!colors[@]}"; do
    M=${M//\[${colors[$i]}\]/\\033[0;3${i}m}
    M=${M//\[bg_${colors[$i]}\]/\\033[4${i}m}
    M=${M//\[${effects[$i]}\]/\\033[${i}m}
  done
  printf "$M\n"
}
EOF