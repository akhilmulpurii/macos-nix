{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.tmux
    pkgs.neovim
  ];
}
