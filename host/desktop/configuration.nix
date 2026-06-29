{inputs, ...}: let
  common = ../common-modules;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
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
    ../laptop/modules/graphics.nix
    ./modules/nvidia.nix
  ];
}
