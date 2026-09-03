{ ... }:
{
  homebrew = {
    enable = true;
    brews = [ "mas" ];
    casks = [ "iina" ];
    masApps = {
      "WhatsApp" = 310633997;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
