{ pkgs, username, ... }:
let
  gitName = builtins.getEnv "GIT_NAME";
  gitEmail = builtins.getEnv "GIT_EMAIL";
  effectiveGitName = if gitName == "" then "Akhil Mulpurii" else gitName;
  effectiveGitEmail = if gitEmail == "" then "akhil@example.com" else gitEmail;
in
{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.configFile = {
    "tmux/tmux.conf" = {
      source = ./dotfiles/tmux/tmux.conf;
      force = true;
    };
    "nvim/init.lua" = {
      source = ./dotfiles/nvim/init.lua;
      force = true;
    };
    "ghostty/config" = {
      source = ./dotfiles/ghostty/config;
      force = true;
    };
    "starship.toml" = {
      source = ./dotfiles/starship.toml;
      force = true;
    };
    "fish/config.fish".force = true;
  };

  home.file = {
    ".gitignore_global".source = ./dotfiles/gitignore_global;
  };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = effectiveGitName;
      user.email = effectiveGitEmail;
      init.defaultBranch = "main";
      core.excludesfile = "/Users/${username}/.gitignore_global";
    };
  };

  home.packages = [
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.zoxide
    pkgs.ripgrep
    pkgs.fd
    pkgs.lazygit
    pkgs.fastfetch
    pkgs.btop
    pkgs.delta
    pkgs.tmux
    pkgs.neovim
  ];
}
