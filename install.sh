#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# beep on sudo
SUDO_PROMPT="$(printf "\a")[sudo] Password:"
export SUDO_PROMPT

if [ "$#" -ne 1 ]; then
    echo "[ERROR] This script accepts exactly one argument."
    # shellcheck disable=SC2016
    echo 'Run `install.sh --dry-run` if you want to check what will be deployed.'
    # shellcheck disable=SC2016
    echo 'Run `install.sh -y` if you really want to deploy dotfiles.'
    exit 1
fi

case "${1}" in
    "--dry-run")
        echo "[INFO] Dry run mode. Files are not actually created."
        opt=$1
        ;;
    "-y" | "--yes")
        echo "[INFO] Installation mode."
        opt=$1
        ;;
    *)
        echo "[ERROR] Unknown argument: ${1}"
        exit 1
        ;;
esac

install() {
    dir=$1
    opt=$2

    if [ ! -d "$dir" ]; then
        return
    fi

    if [ -x "$dir/install.sh" ]; then
        echo "[INFO] installing $dir ..."
        "./$dir/install.sh" "$opt"
        echo "[INFO] installed $dir"
    else
        echo "[SKIP] $dir does not have install.sh"
    fi
}

runfirst=" homedeploy "

for dir in $runfirst; do
    install "$dir" "$opt"
done

for dir in *; do
    case "$runfirst" in
        *" $dir "*)
            # already installed
            continue
            ;;
    esac

    install "$dir" "$opt"
done
