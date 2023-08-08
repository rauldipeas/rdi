#!/bin/bash
set -e

# bashrc.d
mkdir -p "$HOME"/.bashrc.d
sed -i '/^# bashrc.d/{N;N;N;d;}' "$HOME"/.bashrc
cat <<EOF |tee -a "$HOME"/.bashrc>/dev/null
# bashrc.d
for script in "\$HOME"/.bashrc.d/*.bash;do
	source \$script
done
EOF

# Ferramentas CLI
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
sudo apt install\
    apt-rollback\
    deborphan\
    fd\
    gcp\
    git\
    lsd\
    lnav\
    pet\
    rmtrash\
    silversearcher-ag