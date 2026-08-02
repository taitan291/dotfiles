{inputs, ...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/home.nix")
  ];
}
