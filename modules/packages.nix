{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.tmux
    pkgs.neovim
    pkgs.nixd
    pkgs.nil
    pkgs.fish
  ];
}
