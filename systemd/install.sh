#!/bin/bash

dirname="$(dirname "$(readlink -f "$0")")"
echo $dirname
source "$dirname/../scripts/_shared.sh"

src="$dirname/slock.service"
dst="/etc/systemd/system/slock.service"
cp "$src" "$dst"

src="$dirname/suspend.target.wants/slock.service"
dst="/etc/systemd/system/suspend.target.wants/slock.service"
cp "$src" "$dst"
