function prompt_normal --description 'Write out normal prompt'
    printf '%s > ' (prompt_print_status_bar $argv[1])
end