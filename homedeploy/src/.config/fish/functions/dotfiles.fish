set -l dotfiles_dir ~/dotfiles

function dotfiles --description 'manage dotfiles'
    if test (count $argv) -lt 1
        _dotfiles_help
        return
    end
    
    switch $argv[1]
        case help
            _dotfiles_help
        case update
            _dotfiles_update
        case edit
            _dotfiles_edit
    end

    argparse 'h/help' -- $argv

    if set -lq _flag_help
        _dotfiles_help
        return
    end
end

function _dotfiles_git --inherit-variable dotfiles_dir
    git --git-dir=$dotfiles_dir/.git $argv
end

function _dotfiles_help
    echo 'dotfiles: manage dotfiles'
    echo ''
    echo 'Subcommands:'
    echo '  help       print this message'
    echo '  update     git pull'
    echo ''
    echo 'Options:'
    echo '  -h --help  print this message'
    return
end

function _dotfiles_update
    if test (_dotfiles_git branch --show-current) = master
        _dotfiles_git origin master
        _dotfiles_git --no-pager log master..origin/master
        _dotfiles_git merge --stat master origin/master
    else
        echo '[ERROR] dotfiles is currently not on master branch.'
        return 1
    end
end

function _dotfiles_edit --inherit-variable dotfiles_dir
    if type -q code
        code $dotfiles_dir
    else
        echo 'code is not installed.'
        return 1
    end
end
