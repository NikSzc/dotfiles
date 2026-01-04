#!/bin/bash

set -e # Bei Fehler abbrechen

echo "🔧 System aktualisieren..."
sudo apt update
sudo apt upgrade -y

echo "🖥️  Installiere Xorg..."
sudo apt install -y \
    xorg \
    xinit \
    x11-xserver-utils

echo "🪟 Installiere i3 Window Manager..."
sudo apt install -y \
    i3-wm \
    i3status \
    i3lock \
    dmenu \
    alacritty

# Nvim Setup
# rewuirements
sudo apt install -y make gcc ripgrep unzip git xclip curl
# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/

echo "⌨️ Setze deutsches Tastaturlayout..."
setxkbmap de || true

echo "📝 Erstelle .xinitrc..."
if [ ! -f "$HOME/.xinitrc" ]; then
    echo "exec i3" >"$HOME/.xinitrc"
fi

echo "✅ Fertig!"
echo "👉 Starte i3 mit: startx"
