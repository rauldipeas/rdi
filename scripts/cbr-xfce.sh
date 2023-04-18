#!/bin/bash
set -e

# Miniaturas de arquivos cbr no XFCE
if [ -f /usr/share/xsessions/xubuntu.desktop ]; then
    if [ -f /usr/share/thumbnailerers/atril.thumbnailer ]; then
        cp -v /usr/share/thumbnailers/atril.thumbnailer .local/share/thumbnailers/
        sed -i 's@xpsdocument;@xpsdocument;application/x-rar;@g' .local/share/thumbnailers/atril.thumbnailer
    fi
fi