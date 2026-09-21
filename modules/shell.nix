{ pkgs, username, ... }:
{
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.${username}.shell = pkgs.fish;
}
