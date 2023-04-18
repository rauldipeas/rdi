#!/bin/bash
set -e

# Instalação do synth-shell
pkcon install git
git clone --recursive https://github.com/andresgongora/synth-shell.git
bash synth-shell/setup.sh
rm -rf synth-shell
source "$HOME"/.bashrc