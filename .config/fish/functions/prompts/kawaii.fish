function prompt_kawaii_print_face1 --description 'print 1st line of face of prompt'
	if test "$argv[1]" = "0"
		printf ' ʌ_ʌ '
	else
		printf '%s ʌ_ʌ!%s' (set_color red) (set_color normal)
	end
end

function prompt_kawaii_print_face2 --description 'print 2nd line of face of prompt'
	if test "$argv[1]" = "0"
		printf "('-')"
	else
		printf '%s(°-°)%s' (set_color red) (set_color normal)
	end
end

function prompt_kawaii --description 'Write out kawaii prompt'
    printf '%s %s\n' (prompt_kawaii_print_face1 $argv[1]) (prompt_print_status_bar)
    printf '%s < ' (prompt_kawaii_print_face2 $argv[1])
end
