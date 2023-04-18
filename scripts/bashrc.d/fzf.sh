#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do deb-get
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get

# Instalação do fzf
deb-get install bat
pkcon install fzf
cat <<EOF |sudo tee /usr/local/bin/fzf-dir>/dev/null
#!/bin/bash
set -e
/usr/bin/fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
EOF
sudo chmod +x /usr/local/bin/fzf-dir