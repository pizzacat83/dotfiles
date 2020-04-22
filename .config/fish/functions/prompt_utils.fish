if test "$PROMPT_IS_FAKE" = ""
	set PROMPT_IS_FAKE 0
end

function toggle_fake_prompt --description 'toggle whether to use fake strings'
	if test "$PROMPT_IS_FAKE" = "1"
		set -g PROMPT_IS_FAKE 0
	else
		set -g PROMPT_IS_FAKE 1
	end
end

function set_prompt_theme --description 'Change the prompt theme'
	if test "$argv[1]" = ""
		# no args, list themes
        echo "Available Themes:"
		ls -1 (printf "%s/prompts" (dirname (status --current-filename))) | grep --colour=never '^.\+\.fish$' | xargs -n1 -I \{\} basename \{\} .fish
	else
        # theme specified, set theme
        set -l PROMPT_THEME $argv[1]
        if functions -q $PROMPT_THEME
        else
            set -l filename (printf "%s/prompts/%s.fish" (dirname (status --current-filename)) $PROMPT_THEME)
            if test -f $filename
                source $filename
            else
                echo "Error: Theme $PROMPT_THEME not found" >&2
                return 1
            end
        end
        set -g PROMPT_THEME $PROMPT_THEME
    end
end

if test "$PROMPT_THEME" = ""
	set_prompt_theme kawaii
end

function prompt_print_user --description 'print username for prompt'
	if test "$PROMPT_IS_FAKE" = "1"
		echo $FAKE_USERNAME
	else
		whoami
	end
end

function prompt_print_hostname --description 'print hostname for prompt'
	if test "$PROMPT_IS_FAKE" = "1"
		echo $FAKE_HOSTNAME
	else
		prompt_hostname
	end
end

function prompt_print_pwd --description 'print pwd for prompt'
	if test "$PROMPT_IS_FAKE" = "1"
		printf "~/path/to/%s" (basename (pwd))
	else
		prompt_pwd
	end
end

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

function prompt_print_status_bar --description 'print status bar of prompt'
	set -l old_status $argv[1]
	if test "$old_status" = "0"
		set exit_status_prompt ''
	else
		set exit_status_prompt (printf ' %s[%s]%s' (set_color --bold red) $old_status (set_color normal))
	end
	if test "$VIRTUAL_ENV" = ""
		set venv_prompt ''
	else
		set venv_prompt (printf ' %s(py: %s)%s' (set_color brblack) (basename (dirname $VIRTUAL_ENV)) (set_color normal))
	end
	if test -f ~/.config/nvm/version
		set node_prompt (printf " %s(js: %s)%s" (set_color brblack)  (cat ~/.config/nvm/version) (set_color normal))
	else 
		set node_prompt ''
	end
	printf '%s%s%s@%s [%s%s%s]%s%s%s' (set_color cyan) (prompt_print_user) (set_color normal) (prompt_print_hostname) (set_color cyan -u) (prompt_print_pwd) (set_color normal) $exit_status_prompt $venv_prompt $node_prompt
end
