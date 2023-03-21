set FAKE_HOSTNAME (random choice kotatsu ofuton hidamari ohiza)
set FAKE_USERNAME pizzacat83

# set general variables

# setup tools
# poetry
set -x PATH "$HOME/.poetry/bin" $PATH
# rust
set -x PATH "$HOME/.cargo/bin" $PATH
# opam
test -d ~/.opam && source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
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

alias rm="rm -i"
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
