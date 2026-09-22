{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nixd
    pkgs.nil
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.fd
    pkgs.nodejs
  ];
}
