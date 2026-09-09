{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      # "mas"
      "asmvik/formulae/yabai"
      "asmvik/formulae/skhd"
      { name = "felixkratz/formulae/sketchybar"; start_service = true; restart_service = "changed"; }
      "felixkratz/formulae/borders"
    ];
    taps = [
      "zennotes/tap"
      "asmvik/formulae"
      "felixkratz/formulae"
    ];
    casks = [
      "iina"
      "claude"
      "helium-browser"
      "zennotes/tap/zennotes"
      "ghostty"
      "raycast"
      "jordanbaird-ice"
      "notchnook"
      "twingate"
      "bitwarden"
      "github-copilot-app"
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
