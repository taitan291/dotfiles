{inputs, ...}: let
  home = ../../modules;
in {
  imports = [
    (home + "/home.nix")
    #(home + "/waybar")
    #inputs.private-themes.homeModules.wallpaper
    inputs.private-themes.homeModules.uindows-wallpaper
  ];
}
