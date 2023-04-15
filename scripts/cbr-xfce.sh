#!/bin/bash
set -e

# Miniaturas de arquivos cbr no XFCE
cp -v /usr/share/thumbnailers/atril.thumbnailer .local/share/thumbnailers/
sed -i 's@xpsdocument;@xpsdocument;application/x-rar;@g' .local/share/thumbnailers/atril.thumbnailer