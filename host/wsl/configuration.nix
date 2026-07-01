{inputs, ...}: let
  common = ../common-modules;
in {
  imports = [
    ./modules/wsl.nix
    ./modules/system.nix

    (common + "/users.nix")
    (common + "/environment.nix")
    (common + "/nix.nix")
  ];
}
