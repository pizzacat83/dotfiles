#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

nodeploy=" . .. .gitignore .DS_Store "
backup_dir="backup/$(date '+%Y_%m_%d__%H_%M_%S')"

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

[ "$dry_run" -eq 0 ] && mkdir -p "$backup_dir"

for filepath in src/* src/.*; do
    if [ ! -e "$filepath" ]; then
        # this might be unexpanded glob
        echo "[SKIP] $filepath does not exist."
        continue
    fi

    source="$PWD/$filepath"
    filename=$(basename "$filepath")
    target="$HOME/$filename"

    case "$nodeploy" in
        *" $filename "*)
            echo "[SKIP] $filename ignored. skipping."
            continue
            ;;
    esac
    

    if [ -L "$target" ]; then
        current=$(readlink "$target")
        if [ "$current" = "$source" ]; then
            echo "[SKIP] $filename already deployed. skipping."
            continue
        else
            echo "[INFO] $filename is linked to $current"
            echo "[INFO] overwriting link..."
            [ "$dry_run" -eq 0 ] && ln -snfv "$source" "$target"
            continue
        fi
    fi

    if [ -e "$target" ]; then
        echo "[WARN] $filename exists. backed up in $backup_dir/$filename"
        [ "$dry_run" -eq 0 ] && mv "$target" "$backup_dir/"
    fi

    echo "[INFO] deploying $filename..."
    [ "$dry_run" -eq 0 ] && ln -snv "$source" "$target"
done
