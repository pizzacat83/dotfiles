set -l dotfiles_dir ~/dotfiles

function dotfiles --description 'manage dotfiles'
    if test (count $argv) -lt 1
        _dotfiles_help
        return
    end
    
    switch $argv[1]
        case help
            _dotfiles_help
            return $status
        case update
            _dotfiles_update
            return $status
        case edit
            _dotfiles_edit
            return $status
        case install
            _dotfiles_install $argv[2..-1]
            return $status
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

function _dotfiles_install --inherit-variable dotfiles_dir
    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt -s y -l yes)
    set options $options (fish_opt -s d -l dry-run)
    argparse --name "dotfiles install" --exclusive yes,dry-run $options -- $argv
    or return 1

    if set -lq _flag_help
        _dotfiles_install_help
        return
    end

    if not set -lq _flag_dry_run; and not set -lq _flag_yes
        echo [ERROR] Specify either --dry-run or --yes
        return 1
    end

    set -l opt
    if set -lq _flag_yes
        set opt "--yes"
    else
        set opt "--dry-run"
    end

    if test (count $argv) -eq 0
        $dotfiles_dir/install.sh $opt
    else
        for dir in $argv
            if not test -d $dotfiles_dir/$dir
                echo [SKIP] $dir does not exist.
                continue
            else if not test -x $dotfiles_dir/$dir/install.sh
                echo [SKIP] $dotfiles_dir/$dir/install.sh is not executable.
                continue
            else
                $dotfiles_dir/$dir/install.sh $opt
            end
        end
    end
end

function _dotfiles_install_help
    echo 'dotfiles install: install components'
    echo ''
    echo 'Usage: dotfiles install [dir] [--dry-run] [-hy]'
    echo ''
    echo 'Options:'
    echo '  -h --help    print this message'
    echo '  -d --dry-run dry run'
    echo '  -y --yes     really install'
    return
end
