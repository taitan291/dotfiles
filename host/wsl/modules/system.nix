{
  nixpkgs.hostPlatform = "x86_64-linux";
  time.timeZone = "Asia/Tokyo";
  security.rtkit.enable = true;
  system.stateVersion = "26.11";
}
