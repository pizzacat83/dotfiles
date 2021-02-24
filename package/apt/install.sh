#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# shellcheck source=../../install_init.sh
. ../../install_init.sh


if ! command -v apt > /dev/null; then
    echo "[SKIP] This script requires apt."
    exit
fi

if [ "$dry_run" -eq 0 ]; then
    if [ "$(id -u)" -eq 0 ]; then
        # user is root (e.g. docker)
        <packages-min.txt xargs apt install -y
    elif command -v sudo > /dev/null; then
        <packages-min.txt xargs sudo apt install -y
    else
        echo "[ERROR] you need sudo installed to install apt packages."
        exit
    fi
fi
