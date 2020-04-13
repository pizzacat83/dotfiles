#!/bin/bash
cd $(dirname $0)

nodeploy=" .git .gitignore .DS_Store "
backup_dir=~/.dotfiles.backup/$(date '+%Y_%m_%d__%H_%M_%S')

dry_run=0

if [ ${1} = "--dry-run" ]; then
  echo "[INFO] Dry run mode. Files are not actually created."
  dry_run=1
fi

[ $dry_run == 0 ] && mkdir -p backup_dir

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
