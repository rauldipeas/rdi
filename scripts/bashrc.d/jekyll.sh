#!/bin/bash
set -e

# Depende do bashrc.d
#xdg-open https://github.com/rauldipeas/rdi/blob/main/scripts/bash-enhancements.sh

# Instalação do Ruby
sudo apt install ruby-dev

# Configuração do ambiente Ruby
cat <<EOF |tee "$HOME"/.bashrc.d/ruby.bash>/dev/null
export GEM_HOME="\$HOME/.gems"
export PATH="\$HOME/.gems/bin:\$PATH"
EOF
source "$HOME"/.bashrc

# Instalação do Jekyll
gem install bundler jekyll

# Teste opcional
#jekyll new my-awesome-site
#cd my-awesome-site
#bundle exec jekyll serve&sleep 3&&xdg-open http://localhost:4000