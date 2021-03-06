#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# shellcheck source=../../install_init.sh
. ../../install_init.sh


if ! command -v brew > /dev/null; then
    # TODO: install brew?
    echo "[SKIP] This script requires brew installed."
    exit
fi

if [ "$dry_run" -eq 0 ]; then
    brew bundle install --file Brewfile.rb --no-lock

    if [ "$(uname)" = "Darwin" ]; then
        brew bundle install --file Brewfile_cask.rb --no-lock
        brew bundle install --file Brewfile_mas.rb --no-lock
    fi
fi
