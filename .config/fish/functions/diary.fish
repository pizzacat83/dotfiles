function diary --description 'open diary'
    argparse 'h/help' -- $argv

    if set -lq _flag_help
        echo 'diary: open diary'
        echo ''
        echo '-h --help    print this message'
        return
    end

    if not set -q SCRAPBOX_PROJECT
        echo 'Set SCRAPBOX_PROJECT to your scrapbox project name.'
        return 1
    end

    open https://scrapbox.io/$SCRAPBOX_PROJECT/(date "+%Y")%2F(date "+%m")%2F(date "+%d")
end
