{inputs, host, ...}: {
  imports = [
    inputs.private-themes.homeManagerModules.uindows
  ];

  uindows = {
    wallpapers.enable = true;
    waybar.enable = false;
    quickshell.enable = true;
    firefox.enable = true;
    hyprland = "hyprlang";
    # hyprland = "lua";
    resolution = if host == "laptop" then "19201200" else "19201080";
  };
}
