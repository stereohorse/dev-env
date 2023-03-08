if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

source /usr/local/opt/asdf/libexec/asdf.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/viet/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

pyenv init - | source
pyenv virtualenv-init - | source

source /Users/viet/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
