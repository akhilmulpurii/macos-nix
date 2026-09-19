{ lib, username, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      imports = [ ../home.nix ];
      home.username = lib.mkForce username;
      home.homeDirectory = lib.mkForce "/Users/${username}";
    };
  };
}
