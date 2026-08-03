{inputs, ...}: {
  imports = [
    inputs.private-themes.homeManagerModules.uindows
  ];

  uindows = {
    wallpapers.enable = true;
    waybar.enable = false;
    quickshell.enable = true;
  };
}
