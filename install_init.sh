#!/bin/sh -eu
set -eu

# source this file in each install.sh

# beep on sudo
SUDO_PROMPT="$(printf "\a")[sudo] Password:"
export SUDO_PROMPT

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
        # shellcheck disable=SC2034
        dry_run=0
        ;;
    *)
        echo "[ERROR] Unknown argument: ${1}"
        exit 1
        ;;
esac
