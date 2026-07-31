{...}: let
  common = ../common-modules;
in {
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
    ../laptop/modules/graphics.nix
    ./modules/nvidia.nix
  ];
}
