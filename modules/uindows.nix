{ inputs, ... }: {
  imports = [
    inputs.private-themes.homeManagerModules.uindows
  ];

  uindows = {
    #ags.enable = false;
    #gtk.enable = false;
    waybar.enable = true;
    wallpapers.enable = true;
  };
}
