if status is-interactive

# -----------------------------------------------------
# Autostart
# -----------------------------------------------------
fastfetch
set -U fish_greeting ""

# -----------------------------------------------------
# Export
# -----------------------------------------------------
export EDITOR=nvim

# -----------------------------------------------------
# Theme
# -----------------------------------------------------
oh-my-posh init fish --config ~/.config/fish/theme/EDM115-newline.omp.json | source

# -----------------------------------------------------
# General
# -----------------------------------------------------
alias c='clear'
alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias chw='cliphist wipe'

# -----------------------------------------------------
# CustomAlias
# -----------------------------------------------------
alias update='sudo pacman -Syu && yay -Syu && flatpak update'
alias weblogfetch='nmcli device show | grep IP4.DNS'
alias retarded-ass-motherfucker-you-should-kill-yourself-NOW='reboot'
alias keybindconf='$EDITOR ~/.config/hypr/conf/keybinding.conf'

end
