#!/bin/bash
set -e

# Instalar pacotes de linguagem
sudo apt install "$(check-language-support)"