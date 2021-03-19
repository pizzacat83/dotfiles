function aws-vault
    if test (count $argv) -eq 1; and test $argv[1] = "refresh"
        if not set -q AWS_VAULT
            echo 'You are not logged in.'
            return 1
        end

        set -l profile $AWS_VAULT
        set --erase AWS_VAULT
        aws-vault clear $profile
        exec aws-vault exec $profile -- fish
    else
        command aws-vault $argv
    end
end
