#!/bin/sh -eux
set -eux
cd "$(dirname "$0")"

echo "checking requirements..."

if [ ! -d ./src/.config ]; then
    echo "Error: This test requires the existence of dotfiles/.config/."
    exit 1
    # TODO: I think it's better to create dummy dotfiles and dummy ~ for testing.
fi
echo "ok"

echo "creating dummy existing file..."
mkdir -p ~/.config/dir
touch ~/.config/dir/file
echo "done"

# shellcheck disable=SC2016
echo 'running `install.sh --dry-run`...'
bash --posix install.sh --dry-run
echo "done"

echo "checking..."
if [ -L ~/.config ]; then
    echo "Error: ~/.config is a symbolic link; --dry-run actually installed files!"
    exit 1
else
    echo "  [x] ~/.config is still a directory; not installed"
fi
echo "ok"

# shellcheck disable=SC2016
echo 'running `install.sh -y`...'
bash --posix install.sh -y
echo "done"

echo "checking..."
if [ -L ~/.config ]; then
    echo "  [x] ~/.config is now a symbolic link"
else
    echo "Error: ~/.config is not a symbolic link"
    exit 1
fi

# TODO: check if the linked path is dotfiles/.config
# TODO: check if ~/.config is backed up
