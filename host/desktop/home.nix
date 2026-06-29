{...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/shell/desktop.nix")
  ];
}
