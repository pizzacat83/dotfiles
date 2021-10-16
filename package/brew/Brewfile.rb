tap "homebrew/core"
tap "homebrew/cask"
tap "homebrew/bundle"

# shell
brew "fish"

# git
brew "git"
brew "gibo"
brew "gh"
brew "git-secrets"
brew "bfg"

# utilities
brew "coreutils"
brew "colordiff"
brew "jq"
brew "socat"
brew "telnet"
brew "gnupg"
brew "pinentry-mac"
brew "shellcheck"
brew "semgrep"
brew "fzf"
brew "bat" # used by fzf.fish
brew "fd" # used by fzf.fish
brew "thefuck"
brew "terminal-notifier"
brew "mas"
brew "poppler"
brew "pdftk-java"
brew "ocrmypdf"
brew "imagemagick" # used by lyx
brew "smartmontools"
brew "rclone"

# languages
brew "openjdk"
brew "python@3.9"
brew "rbenv"
brew "opam"
brew "haskell-stack"
brew "go"

# cloud
brew "pulumi"

tap "aws/tap"
brew "awscli"

tap "hashicorp/tap"
brew "hashicorp/tap/terraform"

# browsers
cask "google-chrome"
cask "firefox"

# utilities
cask "tunnelblick"
cask "google-drive"
cask "gyazo"
cask "keybase"

# development
cask "ngrok"
cask "docker"
cask "visual-studio-code"
cask "iterm2"
cask "aws-vault"
cask "google-cloud-sdk"
cask "postman"
cask "hex-fiend"
cask "qemu"

# sound
cask "blackhole-16ch"
mas "LadioCast", id: 411213048

# graphics
cask "gimp"
cask "inkscape"
cask "clip-studio-paint"

# video
cask "obs"

# study
cask "mathpix-snipping-tool"
cask "lyx"
cask "anki"
cask "mendeley"
cask "mendeley-reference-manager"
cask "calibre"

# communication
cask "slack"
cask "discord"
cask "zoom"
mas "LINE", id: 539883307

# others
brew "act"

brew "languagetool"

brew "tesseract"

cask "haptickey"
