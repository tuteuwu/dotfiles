fish_config theme choose "my"


if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    neofetch --config ~/.config/neofetch/configShort.conf
end

fish_add_path /home/tute/.spicetify
