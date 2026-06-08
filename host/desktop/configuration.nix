{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../laptop/modules/i18n.nix
    ../laptop/modules/users.nix
    ../laptop/modules/fonts.nix
    ../laptop/modules/boot.nix
    ../laptop/modules/graphics.nix
    ../laptop/modules/display.nix
    ../laptop/modules/services.nix
    ../laptop/modules/udev.nix
    ../laptop/modules/environment.nix
    ../laptop/modules/nix.nix
    ../laptop/modules/system.nix


    ./modules/nvidia.nix
  ];
}
