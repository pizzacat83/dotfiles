function urlencode --description 'urlencode string'
    argparse 'h/help' -- $argv

    if set -lq _flag_help
        echo 'urlencode: urlencode string'
        echo ''
        echo '-h --help    print this message'
        return
    end

    if test (count $argv) -lt 1
        echo 'Please specify text to encode.'
        return 1
    end

    if test (count $argv) -gt 1
        echo 'Too many arguments.'
        return 1
    end

    string escape --style url $argv[1] | string replace -a '/' '%2F'
end
