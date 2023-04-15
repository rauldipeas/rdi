#!/bin/bash
set -e
mkdir -p "$HOME"/.rdi/logs
bash <(wget -qO- https://raw.githubusercontent.com/rauldipeas/rdi/main/scripts/"$@".sh)|tee "$HOME"/.rdi/logs/"$@"-"$(ls -A $HOME/.rdi/logs/$@* 2>/dev/null|wc -l)".log