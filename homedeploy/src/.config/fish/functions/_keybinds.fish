function _keybinds --description 'select things with fzf without scripting'
    if test (count $argv) -ne 1
        echo 'Error: Must specify subcommand and nothing else.'
        return 1
    end

    switch $argv[1]
    case fzf_dir
        _keybinds_fzf_dir $argv[2..-1]
    case '*'
        echo 'Error: Unknown subcommand.'
        return 1
    end
end
