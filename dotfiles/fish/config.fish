set -g fish_greeting

alias rebuild 'sudo darwin-rebuild switch --flake /etc/nix-darwin'
alias nixcfg 'cd /etc/nix-darwin && nvim flake.nix'
alias ls 'eza --icons=auto'
alias ll 'eza -la --icons=auto'
alias cat bat
alias ghostty '/Applications/Ghostty.app/Contents/MacOS/ghostty'

zoxide init fish --cmd cd | source
fzf --fish | source
