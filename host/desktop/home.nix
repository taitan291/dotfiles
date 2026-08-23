{inputs, ...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/path.nix")
  ];
}
