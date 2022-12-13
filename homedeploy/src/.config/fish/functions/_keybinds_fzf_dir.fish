# this function is based on PatrickF1/fzf.fish
# Copyright © 2020 Patrick
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

function _keybinds_fzf_dir --description 'z|fzf key binding'
    set current_token (commandline --current-token)

    set selected (
        z -l |
        string split -f 2 --no-empty ' ' |
        fzf --query=$current_token --tiebreak=index
    )

    set new_token (string escape $selected)

    commandline --current-token --replace $new_token

    commandline --function repaint
end
