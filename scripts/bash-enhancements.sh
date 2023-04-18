#!/bin/bash
set -e

# bashrc.d
sed -i '/^# bashrc.d/{N;N;N;d;}' "$HOME"/.bashrc
cat <<EOF |tee -a "$HOME"/.bashrc>/dev/null
# bashrc.d
for script in "\$HOME"/.bashrc.d/*.bash;do
	source \$script
done
EOF

# Ferramentas CLI
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install\
    apt-rollback\
    deborphan\
    deb-get\
    gcp\
    git\
    lnav\
    pet\
    rmtrash\
    silversearcher-ag
deb-get install\
    fd\
    lsd