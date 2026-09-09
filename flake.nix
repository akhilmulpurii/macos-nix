{
  description = "Valhalla nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  {
    darwinConfigurations."Valhalla" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/system.nix
        ./modules/nix-settings.nix
        ./modules/packages.nix
        ./modules/fonts.nix
        ./modules/homebrew.nix
        ./modules/shell.nix
        ./modules/dotfiles.nix
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/nix-homebrew.nix
      ];
    };
  };
}
