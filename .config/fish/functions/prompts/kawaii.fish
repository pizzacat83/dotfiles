function prompt_kawaii_print_face1 --description 'print 1st line of face of prompt'
	if test "$argv[1]" = "0"
		printf ' ʌ_ʌ '
	else
		printf '%s ʌ_ʌ!%s' (set_color brred) (set_color normal)
	end
end

function prompt_kawaii_print_face2 --description 'print 2nd line of face of prompt'
	if test "$argv[1]" = "0"
		printf "('-')"
	else
		printf '%s(°-°)%s' (set_color brred) (set_color normal)
	end
end

function prompt_kawaii --description 'Write out kawaii prompt'
	set -l old_status $argv[1]
    printf '%s %s\n' (prompt_kawaii_print_face1 $old_status) (prompt_print_status_bar $old_status)
    printf '%s < ' (prompt_kawaii_print_face2 $old_status)
end
