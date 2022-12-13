function funzf --description 'select things with fzf without scripting'
    argparse 'h/help' -- $argv

    if set -lq _flag_help
        _funzf_help
        return 0
    end

    if test (count $argv) -lt 1
        echo 'Error: Specify a subcommand.'
        return 1
    end

    switch $argv[1]
    case ghpr
        _funzf_gh_pr $argv[2..-1]
    case '*'
        echo 'Error: Unknown subcommand.'
        return 1
    end
end

function _funzf_help
    string trim '
funzf: select things with fzf without scripting

Subcommands:
    ghpr: select GitHub pull request

Global options:
    -h --help    print this message
'
end

function _funzf_gh_pr
    # TODO: キーバインディングした方が快適かも？gh コマンド使用中に限ってもいいかもしれない

    gh pr list --json 'number,title' $argv |
    jq -r '.[]|"\(.number)\t\(.title)"' |
    fzf |
    cut -f 1
end
