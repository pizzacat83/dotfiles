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

if defaults read com.apple.screencapture location > /dev/null; then
    if [ "$dry_run" -eq 0 ]; then
        screenshot_dir="$HOME/Pictures/screenshots"
        if [ -d "$screenshot_dir" ]; then
            mkdir -p "$screenshot_dir"
        fi
        defaults write com.apple.screencapture location "$screenshot_dir"
    fi
else
    echo "[ERROR] Failed to set screenshot save location."
    # shellcheck disable=SC2016
    echo '`defaults read com.apple.screencapture location` failed.'
    echo 'This could mean the config data structure has changed.'
    exit 1
fi


