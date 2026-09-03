{ ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "akhil";
    mutableTaps = true;
    trust = {
      formulae = [ ];
      casks = [ ];
      commands = [ ];
      taps = [ ];
    };
  };
}
