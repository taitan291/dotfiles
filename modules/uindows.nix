{
  inputs,
  host,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.private-themes.homeManagerModules.uindows
  ];

  uindows = {
    wallpapers.enable = true;
    quickshell.enable = true;
    firefox.enable = true;
    hyprland = "lua";
    resolution =
      if host == "laptop"
      then "19201200"
      else "19201080";
  };

  home.packages = with pkgs; [
    quickshell
    material-icons
    material-symbols
    qt6.qtdeclarative
    qt6.qtwayland
  ];

  fonts.fontconfig.enable = true;
}
