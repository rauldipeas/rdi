#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

# Instalação do fzf
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install fzf
pacstall -I bat
cat <<EOF |sudo tee /usr/local/bin/fzf-dir>/dev/null
#!/bin/bash
set -e
/usr/bin/fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
EOF
sudo chmod +x /usr/local/bin/fzf-dir