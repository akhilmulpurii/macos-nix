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
      "zed"
      "claude"
      "chatgpt"
      "helium-browser"
      "zennotes/tap/zennotes"
    ];
    masApps = {
      # "WhatsApp" = 310633997;
      # "Word" = 462054704;
      # "Excel" = 462058435;
      # "Outlook" = 985367838;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
