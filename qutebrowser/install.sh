#!/bin/bash

dirname="$(dirname "$(readlink -f "$0")")"
source "$dirname/../scripts/_shared.sh"

src="$dirname/config.py"
dst="$HOME/.config/qutebrowser/config.py"
_link "$src" "$dst"

# install spellcheck dictionary
/usr/share/qutebrowser/scripts/dictcli.py install en-US

src="$dirname/qute.sh"
dst="$HOME/bin/qute"
chmod +x "$src"
_link "$src" "$dst"
