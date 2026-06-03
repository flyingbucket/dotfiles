source /usr/share/cachyos-fish-config/cachyos-config.fish
starship init fish | source
export EDITOR=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/flyingbucket/miniconda3/bin/conda
    eval /home/flyingbucket/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/flyingbucket/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/flyingbucket/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/flyingbucket/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

