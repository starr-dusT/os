#!/usr/bin/env bash

set -ouex pipefail

install_gnome_extension(){
    wget "$1" -O /tmp/ext.zip
    unzip -j /tmp/ext.zip -d "/usr/share/gnome-shell/extensions/$2"
    cp "/usr/share/gnome-shell/extensions/$2/org.gnome.shell.extensions.${2%@*}.gschema.xml" /usr/share/glib-2.0/schemas/
}

# gnome extensions
rm -R /usr/share/gnome-shell/extensions/*
install_gnome_extension https://github.com/starr-dusT/gnome-set-panel-monitor/archive/refs/heads/master.zip gnome-set-panel-monitor@tstarr.us
chmod -R 755 /usr/share/gnome-shell/extensions

# dconf setup
tee /etc/dconf/db/local.d/02-test <<'EOF'
[org/gnome/shell]
favorite-apps = ['chromium-browser.desktop']
EOF

dconf update
