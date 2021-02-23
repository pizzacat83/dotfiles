#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# shellcheck source=../install_init.sh
. ../install_init.sh


# TODO: allow specifying preferred package manager
if command -v brew > /dev/null; then
    echo "[INFO] installing brew formulas..."
    ./brew/install.sh "$1"
elif command -v apt > /dev/null; then
    echo "[INFO] installing apt packages..."
    ./apt/install.sh "$1"
else
    echo "[WARN] cannot find supported package manager. skipping."
fi
