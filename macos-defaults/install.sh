#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# shellcheck source=../install_init.sh
. ../install_init.sh

if [ "$(uname)" != "Darwin" ]; then
    echo "[SKIP] This script only works on macOS."
    exit
fi

# Set screenshot save location
if [ "$dry_run" -eq 0 ]; then
    screenshot_dir="$HOME/Pictures/screenshots"
    if [ -d "$screenshot_dir" ]; then
        mkdir -p "$screenshot_dir"
    fi
    defaults write com.apple.screencapture location "$screenshot_dir"
fi


