{ profile, ... }:
let
  profileModules = {
    core = [ ./profiles/core.nix ];
    dev = [ ./profiles/core.nix ./profiles/dev.nix ];
    creative = [ ./profiles/core.nix ./profiles/dev.nix ./profiles/creative.nix ];
  };
  selectedProfile = if builtins.hasAttr profile profileModules then profile else "core";
in
{
  imports = profileModules.${selectedProfile};
}
