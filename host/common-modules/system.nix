_: {
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  time.timeZone = "Asia/Tokyo";

  security.rtkit.enable = true;

  system.stateVersion = "26.11";
}
