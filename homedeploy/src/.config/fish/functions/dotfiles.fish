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
    end
end

function _dotfiles_git --inherit-variable dotfiles_dir
    git --git-dir=$dotfiles_dir/.git $argv
end

function _dotfiles_help
    echo 'dotfiles: manage dotfiles'
    echo ''
    echo '-h --help  print this message'
    return
end

function _dotfiles_update
    if test (_dotfiles_git branch --show-current) = master
        _dotfiles_git pull
    else
        echo '[ERROR] dotfiles is currently not on master branch.'
        return 1
    end
end
