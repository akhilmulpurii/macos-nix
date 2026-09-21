{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.utm
    pkgs.chatgpt
    pkgs.ffmpeg
  ];
}
