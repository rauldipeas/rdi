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

# mecho
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

# ntfy
pkcon install libnotify-bin pipx
pipx install --system-site-packages ntfy
cat <<EOF |tee "$HOME"/.bashrc.d/ntfy.bash>/dev/null
PATH="\$PATH":"\$HOME"/.local/bin
eval "\$(ntfy shell-integration)"
EOF

# Pesquisa no histórico
cat <<EOF |tee "$HOME"/.bashrc.d/history-search.bash>/dev/null
if [[ \$- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
EOF

# atuin
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install atuin
wget -qO- "$HOME"/.bashrc.d/bash-preexec.sh https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh
cat <<EOF |tee "$HOME"/.bashrc.d/atuin.bash>>/dev/null
[[ -f ~/.bashrc.d/bash-preexec.sh ]] && source ~/.bashrc.d/bash-preexec.sh
eval "\$(atuin init bash --disable-up-arrow)"
EOF

# mcfly
#wget -cq --show-progress $(wget -qO- https://api.github.com/repos/cantino/mcfly/releases|grep browser_download_url|grep download|grep x86_64|grep linux|head -n1|cut -d '"' -f4)
#sudo tar fxz mcfly-*-x86_64-*-linux-musl.tar.gz -C /usr/bin/
#cat <<EOF |tee "$HOME"/.bashrc.d/mcfly.bash>/dev/null
##export MCFLY_LIGHT=TRUE
##export MCFLY_FUZZY=2
##export MCFLY_INTERFACE_VIEW=BOTTOM
##export MCFLY_DISABLE_MENU=TRUE
##export MCFLY_RESULTS_SORT=LAST_RUN
#eval "\$(mcfly init bash)"
#EOF

# hstr
#pkcon install hstr
#cat <<EOF |tee "$HOME"/.bashrc.d/hstr.bash>/dev/null
#alias hh=hstr
#export HSTR_CONFIG=hicolor
#shopt -s histappend
#export HISTCONTROL=ignorespace
#export HISTFILESIZE=10000
#export HISTSIZE=\${HISTFILESIZE}
#export PROMPT_COMMAND="history -a; history -n; \${PROMPT_COMMAND}"
#if [[ \$- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
#if [[ \$- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
#EOF

# synth-shell
#pkcon install git
#git clone --recursive https://github.com/andresgongora/synth-shell.git
#bash synth-shell/setup.sh
#rm -rf synth-shell
#source "$HOME"/.bashrc

# liquidprompt
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install liquidprompt
cp /usr/share/liquidprompt/liquidpromptrc-dist .config/liquidpromptrc
sed -i 's/debian.theme/powerline.theme/g' "$HOME"/.config/liquidpromptrc
cat <<EOF |"$HOME"/.bashrc.d/liquidprompt.bash>/dev/null
echo \$- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt
lp_theme powerline
EOF

# agnoster
#pkcon install git
#mkdir -p "$HOME"/.bashrc.d/themes
#rm -rf "$HOME"/.bashrc.d/themes/agnoster
#git clone -q https://github.com/speedenator/agnoster-bash "$HOME"/.bashrc.d/themes/agnoster
#cat <<EOF |tee "$HOME"/.bashrc.d/agnoster.bash>/dev/null
#source "\$HOME"/.bashrc.d/themes/agnoster/agnoster.bash
#EOF

# Ambiente SSH
sudo apt install --no-install-recommends dropbear
pkcon install openssh-sftp-server
cat <<EOF |tee "$HOME"/.bashrc.d/ssh-environment.bash>/dev/null
export DISPLAY=:0
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
EOF

# micro
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get
deb-get install micro
mkdir -p "$HOME"/.config/micro
cat <<EOF |tee "$HOME"/.config/micro/settings.json>/dev/null
{
	"eofnewline": false,
}
EOF

# fzf
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/apt-repository/main/apt-repository.sh)
pkcon install deb-get
deb-get install bat
pkcon install fzf
cat <<EOF |sudo tee /usr/local/bin/fzf-dir>/dev/null
#!/bin/bash
set -e
/usr/bin/fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
EOF
sudo chmod +x /usr/local/bin/fzf-dir

# bash line editor (ble.sh)
pkcon install git
git clone -q --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX="$HOME"/.local>/dev/null
cat <<EOF |tee "$HOME"/.bashrc.d/blesh.bash>/dev/null
source "\$HOME"/.local/share/blesh/ble.sh
EOF
cat <<EOF |tee "$HOME"/.blerc>/dev/null
ble-face -s auto_complete fg=238,bg=000
bleopt complete_auto_delay=300
EOF
rm -rf ble.sh*

# top programming fonts
bash <(wget -qO- https://github.com/hbin/top-programming-fonts/raw/master/install.sh|sed 's/wget -c/wget -cq --show-progress/g')

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

# pipx
pkcon install pipx
sudo mkdir -p /opt/pipx/bin
sudo chmod -R 777 /opt/pipx
cat <<EOF |sudo tee /etc/X11/Xsession.d/99pipx
export PIPX_HOME='/opt/pipx'
export PIPX_BIN_DIR='/opt/pipx/bin'
export PATH="\$PATH:/opt/pipx/bin"
EOF

# konsave
pipx install konsave