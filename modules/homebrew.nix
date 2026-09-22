{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      # "mas"
      "container"
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
      "jordanbaird-ice"
      "notchnook"
      "twingate"
      "bitwarden"
      "github-copilot-app"
      "discord"
      "balenaetcher"
      "moonlight"
      "obs"
      "copilot-cli"
      "chatgpt"
      "zed"
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
