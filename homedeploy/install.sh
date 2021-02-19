#!/bin/sh -eu
set -eu
cd "$(dirname "$0")"

nodeploy=" .gitignore .DS_Store "
backup_dir="./backup/$(date '+%Y_%m_%d__%H_%M_%S')"

if [ "$#" -ne 1 ]; then
  echo "[ERROR] This script accepts exactly one argument."
  # shellcheck disable=SC2016
  echo 'Run `install.sh --dry-run` if you want to check what will be installed.'
  # shellcheck disable=SC2016
  echo 'Run `install.sh -y` if you really want to install dotfiles.'
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

for filepath in src/.??*; do
  target="$PWD/$filepath"
  file=$(basename "$filepath")

  case "$nodeploy" in
    *" $file "*)
      echo "[SKIP] $file ignored. skipping."
      continue
      ;;
  esac
  

  if [ -L "$HOME/$file" ]; then
    current=$(readlink "$HOME/$file")
    if [ "$current" = "$target" ]; then
      echo "[SKIP] $file already installed. skipping."
      continue
    else
      echo "[INFO] $file is linked to $current"
      echo "[INFO] overwriting link..."
      [ "$dry_run" -eq 0 ] && ln -snfv "$target"  "$HOME/$file"
      continue
    fi
  fi

  if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
    echo "[WARN] $file exists. backed up in $backup_dir/$file"
    [ "$dry_run" -eq 0 ] && mv "$HOME/$file" "$backup_dir/"
  fi

  echo "installing $file..."
  [ "$dry_run" -eq 0 ] && ln -snv "$target"  "$HOME/$file"
done