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

# languages
brew "python@3.9"
brew "rbenv"
brew "opam"
brew "haskell-stack"

# others
brew "pulumi"

tap "aws/tap"
brew "awscli"

tap "hashicorp/tap"
brew "hashicorp/tap/terraform"
