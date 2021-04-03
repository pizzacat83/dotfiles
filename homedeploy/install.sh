#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

# shellcheck source=../install_init.sh
. ../install_init.sh

nodeploy=" . .. .gitignore .DS_Store "
backup_dir="backup/$(date '+%Y_%m_%d__%H_%M_%S')"

if [ "$dry_run" -eq 0 ]; then
    mkdir -p "$backup_dir"
fi

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
            if [ "$dry_run" -eq 0 ]; then
                ln -snfv "$source" "$target"
            fi
            continue
        fi
    fi

    if [ -e "$target" ]; then
        echo "[WARN] $filename exists. backed up in $backup_dir/$filename"
        if [ "$dry_run" -eq 0 ]; then
            mv "$target" "$backup_dir/"
        fi
    fi

    echo "[INFO] deploying $filename..."
    if [ "$dry_run" -eq 0 ]; then
        ln -snv "$source" "$target"
    fi
done
