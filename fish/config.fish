fish_config theme choose "my"

alias randomWallpaper "feh --bg-scale ( $HOME/.config/fish/scripts/getRandomFile.sh ~/Pictures/wallpapers/gruvbox )"
alias clearDownloads "$HOME/.config/fish/scripts/clearDownloads.sh"
alias neofetch "neofetch --ascii_colors 1 2 3 4 5"

if status is-interactive
    set fish_greeting

    
end

