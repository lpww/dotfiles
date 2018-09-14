#!/bin/bash

dirname="$(dirname "$(readlink -f "$0")")"
echo $dirname
source "$dirname/../scripts/_shared.sh"

src="$dirname/xprofile"
dst="$HOME/.xprofile"
_sudo_link "$src" "$dst"

src="$dirname/Xresources"
dst="$HOME/.Xresources"
_link "$src" "$dst"

src="$dirname/colors.Xresources"
dst="$HOME/.colors.Xresources"
_link "$src" "$dst"

src="$dirname/xorg.conf.d/90-monitor.conf"
dst="/etc/X11/xorg.conf.d/90-monitor.conf"
_sudo_link "$src" "$dst"
