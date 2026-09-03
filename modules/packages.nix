{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.tmux
    pkgs.neovim
    pkgs.fish
    pkgs.nixd
    pkgs.nil
    pkgs.starship
    pkgs.zoxide
    pkgs.fzf
    pkgs.eza
    pkgs.bat
    pkgs.delta
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.fd
  ];
}
