{inputs, ...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/home.nix")
    inputs.private-themes.homeModules.wallpaper
  ];
}
