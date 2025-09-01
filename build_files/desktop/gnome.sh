#!/usr/bin/env bash

set -ouex pipefail

tee /etc/dconf/db/local.d/02-test <<'EOF'
[org/gnome/shell]
favorite-apps = ['chromium-browser.desktop']
EOF

dconf update
