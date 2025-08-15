function fish_prompt

    set last_status $status
    set path (shorten_path (pwd | string replace $HOME '~'))

    set bg "#A89984"
    set fg "#1D2021"

    set colorFG (set_color $bg --background normal)
    set colorBG (set_color $fg --background $bg)

    set resetColor (set_color normal --background normal)


    echo -n $colorFG"╔"$colorBG"   "$USER ""

    if test $last_status -ne 0
    echo -n $colorBG"  "$path  ""
    echo $colorBG" 󰞌 "$CMD_DURATION $colorFG""
    else
    echo -n $colorBG"  "$path  ""
    echo $colorBG" 󰞌 "$CMD_DURATION $colorFG""
    end
    echo $colorFG"╚═ "$resetColor

end

function shorten_path --argument-names path
    string split '/' $path | while read -l dir
        if test -z "$dir"
            continue
        end

        if test "$dir" = (string split '/' $path)[-1]
            echo -n "$dir"
        else
            echo -n (string sub -l 1 $dir)/
        end
    end
end

