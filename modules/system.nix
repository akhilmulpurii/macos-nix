{ self, ... }:
{
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
  system.primaryUser = "akhil";
  nixpkgs.hostPlatform = "aarch64-darwin";
}
