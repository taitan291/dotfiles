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
  };

  fonts.fontconfig.enable = true;
}
