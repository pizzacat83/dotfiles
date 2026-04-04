set FAKE_HOSTNAME (random choice kotatsu ofuton hidamari ohiza)
set FAKE_USERNAME pizzacat83

# set general variables

# setup tools
# general
set -x PATH ~/.local/bin/ $PATH

# brew
set -x PATH /usr/local/sbin $PATH

# poetry
set -x PATH "$HOME/Library/Python/3.9/bin" $PATH
# rust
set -x PATH "$HOME/.cargo/bin" $PATH
# opam
test -d ~/.opam && source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# scala
set -x PATH "$HOME/Library/Application Support/Coursier/bin" $PATH
# perl
if type -q plenv; plenv init - | source ; end
# ghcup
set -x PATH "$HOME/.ghcup/bin" $PATH
# TeX Live
set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH
set -x PATH /usr/local/texlive/2021/bin/universal-darwin/ $PATH
# vscode
set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
# gcloud (macOS)
if test -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end
# fzf.fish
set fzf_fish_custom_keybindings
bind \cr __fzf_search_history
bind \cf '_keybinds fzf_dir'
# aliases

if type -q trash
  alias rm="trash"
else
  alias rm="rm -i"
end

alias cp="cp -i"
alias mv="mv -i"

type -q grm; and alias grm="grm -i"
type -q gmv; and alias gmv="gmv -i"

if type -q gcp
  if type -q gcloud
    alias gcp="gcloud"
  else
    set -l gcp_type (type gcp)
    function gcp --description "did you mean `gcloud`?" --inherit-variable gcp_type
      echo $gcp_type
      echo "Did you mean `gcloud`?"
      echo If you really meant to run `gcp`, run `command gcp` instead.
      return 1
    end
  end
end

alias less="less -r"

# apt installs fd as fdfind
if not type -q fd; and type -q fdfind
  alias fd="fdfind"
end

if test -x /Applications/LyX.app/Contents/MacOS/lyx
  alias lyx="/Applications/LyX.app/Contents/MacOS/lyx"
end

# configs
# done
set -x __done_notify_sound 1

# bat
set -x BAT_PAGER "less -R"

set -x OP_PLUGIN_ALIASES_SOURCED 1
alias aws="op plugin run -- aws"

# bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH # ghcup-env
