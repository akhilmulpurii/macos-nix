{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake /etc/nix-darwin#Valhalla";
      nixcfg = "cd /etc/nix-darwin && nvim flake.nix";
      ls = "eza --icons=auto";
      ll = "eza -la --icons=auto";
      cat = "bat";
      ghostty = "/Applications/Ghostty.app/Contents/MacOS/ghostty";
    };
    interactiveShellInit = ''
      set -g fish_greeting
      zoxide init fish --cmd cd | source
      fzf --fish | source
    '';
  };
  environment.shells = [ pkgs.fish ];
  users.users.akhil.shell = pkgs.fish;
}
