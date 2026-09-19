{ username, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      imports = [ ../home.nix ];
      home.username = username;
      home.homeDirectory = "/Users/${username}";
    };
  };
}
