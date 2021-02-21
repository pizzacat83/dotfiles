#!/bin/sh -eu
set -eu

if ! command -v git > /dev/null; then
    # TODO: install git automatically?
    echo "[ERROR] This script requires git installed."
    exit 1
fi

dotfiles_dir="$HOME/dotfiles"

git clone https://github.com/pizzacat83/dotfiles.git "$dotfiles_dir"

echo "[INFO] completely downloaded dotfiles to $dotfiles_dir"
