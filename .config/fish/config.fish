set FAKE_HOSTNAME (random choice kotatsu ofuton hidamari ohiza)
set FAKE_USERNAME pizzacat83

# set general variables

# setup tools
# rust
set -x PATH "$HOME/.cargo/bin" $PATH
# opam
test -d ~/.opam && source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# vscode
set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
