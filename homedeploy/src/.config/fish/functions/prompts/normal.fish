function prompt_normal --description 'Write out normal prompt'
    printf '%s %s ' (prompt_print_status_bar $argv[1]) (prompt_normal_prompt_mark)
end

function prompt_normal_prompt_mark --description 'print root mark of prompt'
	if prompt_is_root
		echo '#'
	else
		echo '>'
	end
end
