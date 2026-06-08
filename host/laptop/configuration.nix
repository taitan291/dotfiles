{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./modules/i18n.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/boot.nix
    ./modules/graphics.nix
    ./modules/display.nix
    ./modules/services.nix
    ./modules/udev.nix
    ./modules/environment.nix
    ./modules/nix.nix
    ./modules/system.nix
  ];
}
