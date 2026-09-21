# macOS Nix Configuration

Declarative macOS configuration using [nix-darwin](https://github.com/nix-darwin/nix-darwin), Nix Flakes, Home Manager, and Homebrew.

## Prerequisites

- Apple Silicon macOS
- [Nix](https://nixos.org/download/)
- Git
- `sudo` access

The flake also manages Homebrew through `nix-homebrew`. Homebrew itself does not need to be installed separately.

On Apple Silicon, install Rosetta before the first rebuild so the Intel Homebrew
prefix can be used without warnings:

```sh
softwareupdate --install-rosetta
```

## Configure your identity

Copy the example environment file and edit the values for your machine:

```sh
cp .env.example .env
source .env
```

The configuration uses these variables:

| Variable | Purpose |
| --- | --- |
| `NIX_USERNAME` | macOS account name |
| `NIX_HOSTNAME` | Name of the `darwinConfigurations` entry |
| `NIX_PROFILE` | Machine profile: `core`, `dev`, or `creative` |
| `GIT_NAME` | Git author name |
| `GIT_EMAIL` | Git author email |

`.env` is local-only and should not be committed. The repository only contains `.env.example`.

## First activation

From the repository root, activate the configuration with:

```sh
source .env
sudo darwin-rebuild switch --flake ".#${NIX_HOSTNAME}"
```

If the `darwin-rebuild` command is not available yet, use the nix-darwin bootstrap command:

```sh
nix run nix-darwin -- switch --flake ".#${NIX_HOSTNAME}"
```

After activation, the `rebuild` Fish alias can be used for subsequent updates.

## Profiles

Profiles are selected with `NIX_PROFILE`:

```sh
source .env
NIX_PROFILE=core sudo darwin-rebuild switch --flake ".#${NIX_HOSTNAME}"
NIX_PROFILE=dev sudo darwin-rebuild switch --flake ".#${NIX_HOSTNAME}"
NIX_PROFILE=creative sudo darwin-rebuild switch --flake ".#${NIX_HOSTNAME}"
```

- `core`: shared workstation configuration
- `dev`: core plus development tools
- `creative`: dev plus media and virtualization tools

The profile defaults to `core` when `NIX_PROFILE` is unset or unsupported.

## Managed dotfiles

Home Manager installs the tracked configuration files into the user home directory:

- `dotfiles/fish/config.fish` -> `~/.config/fish/config.fish`
- `dotfiles/ghostty/config` -> `~/.config/ghostty/config`
- `dotfiles/nvim/init.lua` -> `~/.config/nvim/init.lua`
- `dotfiles/starship.toml` -> `~/.config/starship.toml`
- `dotfiles/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`
- `dotfiles/gitignore_global` -> `~/.gitignore_global`

Fish, Git, Starship, package installation, and user-level settings are also configured through Home Manager.

## Validate changes

Run the same check used by GitHub Actions:

```sh
nix --extra-experimental-features "nix-command flakes" \
  flake check --no-write-lock-file
```

You can test a profile explicitly:

```sh
NIX_USERNAME=ci-user \
NIX_HOSTNAME=ci-host \
NIX_PROFILE=creative \
GIT_NAME="CI User" \
GIT_EMAIL="ci@example.com" \
nix flake check --no-write-lock-file
```

Pull requests and pushes to `main` run this check automatically on macOS through GitHub Actions.

## Update inputs

To update the pinned Nix inputs:

```sh
nix flake update
```

Review the resulting `flake.lock` changes, then run the validation command before activating the update.
