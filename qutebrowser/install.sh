#!/bin/bash

dirname="$(dirname "$(readlink -f "$0")")"
source "$dirname/../scripts/_shared.sh"

src="$dirname/config.py"
dst="$HOME/.config/qutebrowser/config.py"
_link "$src" "$dst"
