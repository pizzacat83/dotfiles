#!/bin/bash -eu
set -eu
cd $(dirname $0)

nodeploy=" .git .github .gitignore .DS_Store "
backup_dir=~/.dotfiles.backup/$(date '+%Y_%m_%d__%H_%M_%S')

if [ $# -ne 1 ]; then
  echo "[ERROR] This script accepts only one argument."
  echo "Run `install.sh --dry-run` if you want to check what will be installed."
  echo "Run `install.sh -y` if you really want to install dotfiles." 
  exit 1
fi

case "${1}" in
  "--dry-run")
    echo "[INFO] Dry run mode. Files are not actually created."
    dry_run=1
    ;;
  "-y" | "--yes")
    echo "[INFO] Installation mode."
    dry_run=1
    ;;
  "*")
    echo "[ERROR] Unknown argument: ${1}"
    exit 1
    ;;
esac

[ $dry_run == 0 ] && mkdir -p $backup_dir

for file in .??*; do
  if [[ $nodeploy == *" $file "* ]]; then
    echo "[SKIP] $file ignored. skipping."
    continue
  fi
  if [ -L "$HOME/$file" ]; then
    echo "[SKIP] $file already installed. skipping."
    continue
  fi
  if [ -f "$HOME/$file" -o -d "$HOME/$file" ]; then
    echo "[WARN] $file exists. backed up in $backup_dir/$file"
    [ $dry_run == 0 ] && mv $HOME/$file $backup_dir/
  fi
  echo "installing $file..."
  [ $dry_run == 0 ] && ln -snfv $PWD/$file $HOME/$file
done
