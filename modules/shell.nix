{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake /etc/nix-darwin#Valhalla";
    };
  };
  environment.shells = [ pkgs.fish ];
  users.users.akhil.shell = pkgs.fish;
}
