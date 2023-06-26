#!/bin/bash
set -e

# Depende do Pacstall
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/pacstall.sh

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
pkcon install\
    apt-rollback\
    deborphan\
    fd\
    gcp\
    git\
    lnav\
    pet\
    rmtrash\
    silversearcher-ag
pacstall -I lsd-deb