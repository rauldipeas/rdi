#!/bin/bash
set -e

# Instalação do Firefox
wget -cq --show-progress -O firefox-latest-linux64-pt-br.tar.bz2 'https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR'
tar fjx firefox-latest-linux64-pt-br.tar.bz2
sudo mkdir -p /opt/firefox
sudo chmod 777 /opt/firefox
mv firefox/* /opt/firefox/
sudo mkdir -p /usr/local/bin /usr/local/share/applications /usr/local/share/pixmaps
sudo ln -fs /opt/firefox/firefox /usr/local/bin/firefox
sudo ln -fs /opt/firefox/browser/chrome/icons/default/default128.png /usr/local/share/pixmaps/firefox.png
rm -rf firefox*
cat <<EOF |sudo tee /opt/firefox/defaults/pref/rdx-enhancements.js>/dev/null
/* Aceleração por GPU */
pref('gfx.webrender.all', true);
pref('media.ffmpeg.vaapi.enabled', true);

/* Atualizações automáticas */
pref('app.update.auto', true);
/* pref('app.update.enabled', true); */
/* pref('app.update.silent', true); */

/* Cantos arredondados */
pref('layers.acceleration.force-enabled', true);
pref('mozilla.widget.use-argb-visuals', true);

/* Coleta de dados */
pref('app.shield.optoutstudies.enabled', false);
pref('browser.crashReports.unsubmittedCheck.autoSubmit2', false);
pref('browser.discovery.enabled', false);
pref('datareporting.policy.dataSubmissionEnabled', false);
pref('datareporting.healthreport.service.enabled', false);
pref('datareporting.healthreport.uploadEnabled', false);
pref('toolkit.telemetry.archive.enabled', false);
pref('toolkit.telemetry.enabled', false);
pref('toolkit.telemetry.prompted', 2);
pref('toolkit.telemetry.server', '');
pref('toolkit.telemetry.unified', false);
pref('toolkit.telemetry.unifiedIsOptIn', false);

/* CSD */
pref("browser.tabs.inTitlebar", 1);

/* Estilos personalizados do usuário */
pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);

/* Atividade da nova aba */
pref('browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons', false);
pref('browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features', false);
pref('browser.newtabpage.activity-stream.feeds.snippets', false);
pref('browser.newtabpage.activity-stream.showSponsoredTopSites', false);

/* Modo apenas HTTPS */
pref('dom.security.https_only_mode', true);

/* Página inicial */
pref('browser.startup.homepage', 'https://rauldipeas.surge.sh');

/* Recursos nativos desativados */
pref('browser.tabs.firefox-view', false);
pref('browser.tabs.tabmanager.enabled', false);
pref('extensions.pocket.enabled', false);

/* Sugestões de pesquisa */
pref('browser.urlbar.suggest.bookmark', false);
pref('browser.search.suggest.enabled', false);
pref('browser.urlbar.suggest.engines', false);
pref('browser.urlbar.suggest.openpage', false);
pref('browser.urlbar.suggest.topsites', false);
EOF
cat <<EOF |sudo tee /usr/local/share/applications/firefox.desktop>/dev/null
[Desktop Entry]
Version=1.0
Name=Firefox
Comment=Navegue na internet
GenericName=Navegador de internet
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true

Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=Abrir uma nova janela
Exec=firefox -new-window

[Desktop Action new-private-window]
Name=Abrir uma nova janela no modo privado
Exec=firefox -private-window
EOF