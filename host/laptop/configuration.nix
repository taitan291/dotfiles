{...}: let
  common = ../common-modules;
in {
  imports = [
    (common + "/i18n.nix")
    (common + "/users.nix")
    (common + "/fonts.nix")
    (common + "/boot.nix")
    (common + "/display.nix")
    (common + "/services.nix")
    (common + "/udev.nix")
    (common + "/environment.nix")
    (common + "/nix.nix")
    (common + "/system.nix")
    ./modules/graphics.nix
  ];
}
