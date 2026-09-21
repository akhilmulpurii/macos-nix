{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.fish
    pkgs.cmatrix
    pkgs.cava
  ];
}
