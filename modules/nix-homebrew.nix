{ ... }:
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
