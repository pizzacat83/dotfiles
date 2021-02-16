function dict --description 'open dictionary'
    argparse 'h/help' 's/source=' -- $argv

    if set -lq _flag_help
        echo 'dict: open dictionary'
        echo ''
        echo '-h --help    print this message'
        echo '-s --source  specify source'
        return
    end

    set -l source 'eijiro'
    
    if set -lq _flag_source
        set source $_flag_source
    end

    if test (count $argv) -lt 1
        echo 'Please specify a word.'
        return 1
    end

    if test (count $argv) -gt 1
        echo 'Too many arguments.'
        return 1
    end

    switch $source
        case eijiro
            set url "https://eow.alc.co.jp/search?q=$argv[1]"
        case oxford
            set url "https://www.oxfordlearnersdictionaries.com/definition/english/$argv[1]"
        case '*'
            echo "unknown source: $argv[1]"
            return 1
    end

    open $url
end
