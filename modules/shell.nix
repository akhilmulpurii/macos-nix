{ pkgs, username, ... }:
{
  environment.shells = [ pkgs.fish ];
  users.users.${username}.shell = pkgs.fish;
}
