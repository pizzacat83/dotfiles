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
brew "bat"
brew "fd"
brew "shellcheck"
brew "thefuck"
brew "terminal-notifier"
brew "mas"
brew "imagemagick"
brew "smartmontools"
brew "rclone"
brew "lnav"
brew "navi"
brew "topgrade"
brew "grpcurl"
cask "ngrok"
brew "cloc"

# languages
brew "openjdk"
brew "python@3.13"
brew "rbenv"
brew "opam"
brew "go"
brew "coursier/formulas/coursier"
brew "opa"
brew "deno"
cask "dotnet-sdk"

# PDF utilities
brew "poppler"
brew "pdftk-java"
brew "ocrmypdf"
brew "pdfgrep"
cask "pdfpc"
cask "pympress"

# cloud
cask "google-cloud-sdk"

cask "aws-vault"
tap "aws/tap"
brew "awscli"
brew "azure-cli"

tap "hashicorp/tap"
brew "hashicorp/tap/terraform"

# browsers
cask "google-chrome"
cask "firefox"

# development
cask "docker"
cask "visual-studio-code"
cask "iterm2"
brew "qemu"
brew "mysql"
brew "aqua"
brew "ast-grep"
brew "gdb"
brew "ghcup"
brew "jnv"
brew "ripgrep"
brew "rlwrap"
brew "watchexec"
brew "wget"
cask "codex"
cask "orbstack"
brew "pandoc"

# sound
cask "blackhole-16ch"
mas "LadioCast", id: 411213048

# graphics
cask "skitch"
cask "gimp"
cask "inkscape"

# study
cask "kindle" if personal?
cask "honto" if personal?

# communication
cask "keybase"
cask "slack"
cask "discord" if personal?
cask "zoom"
mas "LINE", id: 539883307 if personal?

# fonts
cask "font-inter"
cask "font-noto-sans-jp"
cask "font-ubuntu-mono"

# misc
cask "google-drive"

cask "1password"
cask "1password-cli"

cask "obsidian"

cask "logseq"

cask "raycast"

cask "rectangle"

go "github.com/go-delve/delve/cmd/dlv"
go "github.com/golangci/golangci-lint/cmd/golangci-lint"
go "golang.org/x/tools/gopls"

cargo "cargo-about"
cargo "cargo-all-features"
cargo "cargo-binutils"
cargo "cargo-crev"
cargo "cargo-edit"
cargo "cargo-generate"
cargo "cargo-llvm-cov"
cargo "cargo-watch"
cargo "kani-verifier"
cargo "trunk"
