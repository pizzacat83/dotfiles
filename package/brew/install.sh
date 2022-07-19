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

    sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

    fish="$(which fish)"
    if not grep -Fq "$fish" /etc/shells; then
        echo "$fish" | sudo tee -a /etc/shells
    fi
    if echo 'Need to implement how to check whether fish is default shell'; false; then
      # dscl . -read $HOME UserShell # for macos
      printf "You will be asked for your password to change the default shell.\a"
      chsh -s "$fish"
    fi
fi
