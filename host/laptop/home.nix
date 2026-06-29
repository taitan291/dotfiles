{...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/shell/laptop.nix")
  ];
}
