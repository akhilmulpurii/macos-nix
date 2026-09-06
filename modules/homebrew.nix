{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      # "mas"
    ];
    taps = [
      "zennotes/tap"
    ];
    casks = [
      "iina"
      "claude"
      "helium-browser"
      "zennotes/tap/zennotes"
      "ghostty"
      "raycast"
      "stats"
      "jordanbaird-ice"
      "notchnook"
    ];
    masApps = {
      # "WhatsApp" = 310633997;
      # "Word" = 462054704;
      # "Excel" = 462058435;
      # "Outlook" = 985367838;
      # "Amphetamine" = 937984704;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
