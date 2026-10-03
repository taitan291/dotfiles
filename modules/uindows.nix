{
  inputs,
  host,
  ...
}: {
  imports = [
    inputs.uindows-themes.homeManagerModules.uindows
  ];

  uindows = {
    wallpapers.enable = true;
    quickshell.enable = true;
    firefox.enable = true;
    resolution =
      if host == "laptop"
      then "19201200"
      else "19201080";
  };

  fonts.fontconfig.enable = true;
}
