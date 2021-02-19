set FAKE_HOSTNAME (random choice kotatsu ofuton hidamari ohiza)
set FAKE_USERNAME pizzacat83
set SCRAPBOX_PROJECT pizzacat83

# set general variables

# setup tools
# poetry
set -x PATH "$HOME/.poetry/bin" $PATH
# rust
set -x PATH "$HOME/.cargo/bin" $PATH
# opam
test -d ~/.opam && source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# vscode
set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
# gcloud (macOS)
if test -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

# aliases

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
