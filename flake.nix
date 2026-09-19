{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    let
      hostName = builtins.getEnv "NIX_HOSTNAME";
      userName = builtins.getEnv "NIX_USERNAME";
      profileName = builtins.getEnv "NIX_PROFILE";
      effectiveHostName = if hostName == "" then "Valhalla" else hostName;
      effectiveUserName = if userName == "" then "akhil" else userName;
      effectiveProfile = if profileName == "" then "core" else profileName;
      supportedProfiles = [ "core" "dev" "creative" ];
      selectedProfile = if builtins.elem effectiveProfile supportedProfiles then effectiveProfile else "core";
    in
    {
      darwinConfigurations.${effectiveHostName} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self;
          hostname = effectiveHostName;
          username = effectiveUserName;
          profile = selectedProfile;
        };
        modules = [
          ./modules/system.nix
          ./modules/nix-settings.nix
          ./modules/packages.nix
          ./modules/profiles.nix
          ./modules/fonts.nix
          ./modules/homebrew.nix
          ./modules/shell.nix
          home-manager.darwinModules.home-manager
          ./modules/home-manager.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./modules/nix-homebrew.nix
        ];
      };
    };
}
