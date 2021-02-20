#!/bin/sh -eu
set -eu

if [ "$#" -ne 1 ]; then
    echo "[ERROR] This script accepts exactly one argument."
    # shellcheck disable=SC2016
    echo 'Run `install.sh --dry-run` if you want to check what will be installed.'
    # shellcheck disable=SC2016
    echo 'Run `install.sh -y` if you really want to install.'
    exit 1
fi

case "${1}" in
    "--dry-run")
        echo "[INFO] Dry run mode. Files are not actually created."
        dry_run=1
        ;;
    "-y" | "--yes")
        echo "[INFO] Installation mode."
        dry_run=0
        ;;
    *)
        echo "[ERROR] Unknown argument: ${1}"
        exit 1
        ;;
esac

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


