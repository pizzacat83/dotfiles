# TODO: キーバインディングした方が快適かも？gh コマンド使用中に限ってもいいかもしれない

function ghpr --description 'fzf GitHub pull requests'
    argparse 'h/help' -- $argv

    if set -lq _flag_help
        echo 'ghpr: fzf GitHub pull requests'
        echo ''
        echo '-h --help    print this message'
        return
    end

    if test (count $argv) -gt 0
        echo 'Too many arguments.'
        return 1
    end

    gh pr list --json 'number,title' |
    jq -r '.[]|"\(.number)\t\(.title)"' |
    fzf |
    cut -f 1
end
