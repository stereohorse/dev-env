function fish_prompt
    echo -n '['
    set_color $fish_color_cwd
    echo -n (basename $PWD)
    set_color normal
    echo -n '] '
end
