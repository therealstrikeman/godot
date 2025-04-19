#!/bin/sh
echo -ne '\033c\033]0;project horde\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/linux shooter.x86_64" "$@"
