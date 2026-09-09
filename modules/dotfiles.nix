{ ... }:
let
  user = "akhil";
  home = "/Users/${user}";
  dotfiles = ../dotfiles;

  # target (relative to $HOME) -> source (relative to ./dotfiles)
  links = {
    ".config/fish/fish_plugins" = "fish/fish_plugins";
    ".config/ghostty/config" = "ghostty/config";
    ".config/btop/btop.conf" = "btop/btop.conf";
    ".config/starship.toml" = "starship.toml";
    ".config/skhd/skhdrc" = "skhd/skhdrc";
    ".config/yabai/yabairc" = "yabai/yabairc";
    ".config/sketchybar/sketchybarrc" = "sketchybar/sketchybarrc";
    ".config/sketchybar/colors.sh" = "sketchybar/colors.sh";
    ".config/sketchybar/plugins" = "sketchybar/plugins";
  };

  linkCmd = target: source: ''
    mkdir -p "$(dirname "${home}/${target}")"
    rm -rf "${home}/${target}"
    ln -sf "${dotfiles}/${source}" "${home}/${target}"
  '';
in
{
  system.activationScripts.postActivation.text = ''
    echo "Linking application dotfiles for ${user}..." >&2
    ${builtins.concatStringsSep "\n" (builtins.attrValues (builtins.mapAttrs linkCmd links))}
    chown -R ${user}:staff "${home}/.config/fish/fish_plugins" "${home}/.config/ghostty" "${home}/.config/btop" "${home}/.config/starship.toml" "${home}/.config/skhd" "${home}/.config/yabai" "${home}/.config/sketchybar"
  '';
}
