{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
      hostName = builtins.getEnv "NIX_HOSTNAME";
      userName = builtins.getEnv "NIX_USERNAME";
      effectiveHostName = if hostName == "" then "Valhalla" else hostName;
      effectiveUserName = if userName == "" then "akhil" else userName;
    in
    {
      darwinConfigurations.${effectiveHostName} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self;
          hostname = effectiveHostName;
          username = effectiveUserName;
        };
        modules = [
          ./modules/system.nix
          ./modules/nix-settings.nix
          ./modules/packages.nix
          ./modules/fonts.nix
          ./modules/homebrew.nix
          ./modules/shell.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./modules/nix-homebrew.nix
        ];
      };
    };
}
