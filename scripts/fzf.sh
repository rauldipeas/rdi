#!/bin/bash
set -e

# Instalação do fzf
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install bat fzf
cat <<EOF |sudo tee /usr/local/bin/fzf-dir>/dev/null
#!/bin/bash
set -e
/usr/bin/fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
EOF
sudo chmod +x /usr/local/bin/fzf-dir