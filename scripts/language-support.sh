#!/bin/bash
set -e

# Instalar pacotes de linguagem
pkcon install $(check-language-support)