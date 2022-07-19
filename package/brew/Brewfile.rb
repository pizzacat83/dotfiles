def hobby?()
    # environment variable needs to start with HOMEBREW_
    # so that brew bundle command passes it 
    # return ENV.has_key?("HOMEBREW_PIZZACAT83_HOBBY")
    raise "not implemented yet"
end

def personal?()
    raise "not implemented yet"
end

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

# PGP
brew "gnupg"
brew "pinentry-mac"

# utilities
brew "coreutils"
brew "colordiff"
brew "jq"
brew "socat"
brew "telnet"
brew "fzf"
brew "bat" # used by fzf.fish
brew "fd" # used by fzf.fish
brew "shellcheck"
brew "semgrep"
brew "thefuck"
brew "terminal-notifier"
brew "mas"
brew "imagemagick"
brew "tesseract"
brew "smartmontools"
brew "rclone"
cask "ngrok"

# languages
brew "openjdk"
brew "python@3.9"
brew "rbenv"
brew "opam"
brew "haskell-stack"
brew "go"

# PDF utilities
brew "poppler"
brew "pdftk-java"
brew "ocrmypdf"

# cloud
brew "pulumi"
cask "google-cloud-sdk"

cask "aws-vault"
tap "aws/tap"
brew "awscli"

tap "hashicorp/tap"
brew "hashicorp/tap/terraform"

# browsers
cask "google-chrome"
cask "firefox"

# development
cask "docker"
cask "visual-studio-code"
cask "iterm2"
cask "postman"
cask "hex-fiend"
brew "qemu"
brew "act"

# sound
cask "blackhole-16ch"
mas "LadioCast", id: 411213048

# graphics
cask "gimp"
cask "inkscape"
cask "clip-studio-paint" if hobby?

# video
cask "obs" if hobby?

# study
cask "mathpix-snipping-tool"
cask "lyx"
cask "anki"
cask "mendeley"
cask "mendeley-reference-manager"
cask "calibre"

# communication
cask "keybase"
cask "slack"
cask "discord" if personal?
cask "zoom"
mas "LINE", id: 539883307 if personal?

# misc
brew "languagetool"

cask "haptickey"

cask "tunnelblick"

cask "google-drive"

cask "gyazo"
