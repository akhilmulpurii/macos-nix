{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.tmux
    pkgs.neovim
    pkgs.fish
    pkgs.starship
    pkgs.zoxide
    pkgs.fzf
    pkgs.eza
    pkgs.bat
    pkgs.delta
    pkgs.cmatrix
    pkgs.cava
    pkgs.btop
    pkgs.fastfetch
  ];
}
