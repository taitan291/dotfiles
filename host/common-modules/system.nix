{...}: {
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  security.rtkit.enable = true;

  system.stateVersion = "26.11";
}
