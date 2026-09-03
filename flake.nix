{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
	 pkgs.alacritty
	 pkgs.tmux
	 pkgs.neovim
        ];

      homebrew = {
      	enable = true;
	brews = [
	  "mas"
	];
	casks = [
          "iina"
	];
	masApps = {
         "WhatsApp" = 310633997;
	};
	onActivation.cleanup = "zap";
	onActivation.autoUpdate = true;
	onActivation.upgrade = true;
      };

      nixpkgs.config.allowUnfree = true;

      fonts.packages = [
       pkgs.nerd-fonts.jetbrains-mono
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;
      
      system.primaryUser = "akhil";
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Valhalla
    darwinConfigurations."Valhalla" = nix-darwin.lib.darwinSystem {
      modules = [
       configuration
       nix-homebrew.darwinModules.nix-homebrew
       {
         nix-homebrew = {
           enable = true;
	   enableRosetta = true;
	   user = "akhil";
	   mutableTaps = false;

	   trust = {
             formulae = [ ];
             casks = [ ];
             commands = [ ];
             taps = [ ];
           };
	 };
       }
       # Optional: Align homebrew taps config with nix-homebrew
       ({config, ...}: {
         homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
       })
      ];
    };
  };
}
