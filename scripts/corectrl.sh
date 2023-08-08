#!/bin/bash
set -e

# Configuração de baixa prioridade para o repositório do CoreCtrl
sudo add-apt-repository ppa:ernstp/mesarc
cat <<EOF |sudo tee /etc/apt/preferences.d/corectrl
# Never prefer packages from the ernstp repository
Package: *
Pin: release o=LP-PPA-ernstp-mesarc
Pin-Priority: 1

# Allow upgrading only corectrl from LP-PPA-ernstp-mesarc
Package: corectrl
Pin: release o=LP-PPA-ernstp-mesarc
Pin-Priority: 500
EOF

# Instalação do CoreCtl
sudo apt install corectrl

# Configuração para o lançamento do CoreCtl no início da sessão
cp /usr/share/applications/org.corectrl.corectrl.desktop "$HOME"/.config/autostart/org.corectrl.corectrl.desktop
sed -i 's/Exec=corectrl/Exec=corectrl --toggle-manual-profile/g' "$HOME"/.config/autostart/org.corectrl.corectrl.desktop 

# Configuração da permissão de execução
cat <<EOF |sudo tee /etc/polkit-1/localauthority/50-local.d/90-corectrl.pkla>/dev/null
[User permissions]
Identity=unix-group:$USER
Action=org.corectrl.*
ResultActive=yes
EOF

# Configuração do GRUB para habilitar os perfis adicionais de gerenciamento de energia
sudo sed -i 's/amdgpu.ppfeaturemask=0xffffffff //g' /etc/default/grub.d/cmdline-linux-default.cfg
sudo sed -i 's/="/="amdgpu.ppfeaturemask=0xffffffff /g' /etc/default/grub.d/cmdline-linux-default.cfg
sudo update-grub