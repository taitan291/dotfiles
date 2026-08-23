_: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 0;
      resize_on_border = true;
      allow_tearing = false;
      layout = "dwindle";
    };
    decoration = {
      rounding = 12;
      rounding_power = 10.0;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
    };

    # レイアウト
    dwindle = {
      #pseudotile = true;
      preserve_split = true;
    };
  };
}
