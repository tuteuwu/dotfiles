function fish_prompt

    set last_status $status
    set path (shorten_path (pwd | string replace $HOME '~'))

    set bg "#282828"
    set blue "#458588"
    set purple "#B16286"
    set aqua "#689D6A"
    set red "#CC241D"

    set blueFG (set_color $blue --background normal)
    set aquaFG (set_color $aqua --background normal)
    set redFG (set_color $red --background normal)

    set blueBG (set_color $bg --background $blue)
    set purpleBG (set_color $bg --background $purple)
    set aquaBG (set_color $bg --background $aqua)
    set redBG (set_color $bg --background $red)

    set blueToPurple (set_color $blue --background $purple)
    set purpleToAqua (set_color $purple --background $aqua)
    set purpleToRed (set_color $purple --background $red)

    set resetColor (set_color normal --background normal)


    echo -n $blueFG"╭"$blueBG" "$USER $blueToPurple""

    if test $last_status -ne 0
    echo -n $purpleBG"  "$path $purpleToRed""
    echo $redBG" 󰞌 "$CMD_DURATION$redFG""
    else
    echo -n $purpleBG"  "$path $purpleToAqua""
    echo $aquaBG" 󰞌 "$CMD_DURATION$aquaFG""
    end
    echo $blueFG"╰  > "$resetColor

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

