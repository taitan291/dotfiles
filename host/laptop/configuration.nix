{...}: let
  common = ../common-modules;
  home = ../../modules;
in {
  nixpkgs.overlays = [
    (import ../../overlays/libfprint-etu906axx-e.nix)
  ];

  imports = [
    ./hardware-configuration.nix

    (common + "/i18n.nix")
    (common + "/users.nix")
    (common + "/fonts.nix")
    (common + "/boot.nix")
    (common + "/display.nix")
    (common + "/audio.nix")
    (common + "/bluetooth.nix")
    (common + "/services.nix")
    (common + "/udev.nix")
    (common + "/environment.nix")
    (common + "/nix.nix")
    (common + "/system.nix")
    (common + "/nix_ld.nix")
    (common + "/battery.nix")
    ./modules/graphics.nix
    # ./modules/fingerprint.nix

    (home + "/steam")
  ];
}
