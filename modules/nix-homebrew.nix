{ username, ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    mutableTaps = true;
    trust = {
      formulae = [ ];
      casks = [ ];
      commands = [ ];
      taps = [ ];
    };
  };
}
