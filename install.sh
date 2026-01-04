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

echo "⌨️ Setze deutsches Tastaturlayout..."
setxkbmap de || true

echo "📝 Erstelle .xinitrc..."
if [ ! -f "$HOME/.xinitrc" ]; then
    echo "exec i3" >"$HOME/.xinitrc"
fi

echo "✅ Fertig!"
echo "👉 Starte i3 mit: startx"
