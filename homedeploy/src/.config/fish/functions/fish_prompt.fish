source (printf "%s/prompt_utils.fish" (dirname (status --current-filename)))

function fish_prompt --description 'Write out the prompt'
	set -l PROMPT_STATUS $status
	eval prompt_$PROMPT_THEME $PROMPT_STATUS
end
