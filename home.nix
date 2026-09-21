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
    "tmux/tmux.conf".source = ./dotfiles/tmux/tmux.conf;
    "nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    "ghostty/config".source = ./dotfiles/ghostty/config;
    "starship.toml".source = ./dotfiles/starship.toml;
  };

  home.file = {
    ".gitignore_global".source = ./dotfiles/gitignore_global;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake /etc/nix-darwin";
      nixcfg = "cd /etc/nix-darwin && nvim flake.nix";
      ls = "eza --icons=auto";
      ll = "eza -la --icons=auto";
      cat = "bat";
      ghostty = "/Applications/Ghostty.app/Contents/MacOS/ghostty";
    };
    interactiveShellInit = ''
      set -g fish_greeting
      zoxide init fish --cmd cd | source
      fzf --fish | source
    '';
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
