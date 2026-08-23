{...}: {
  programs.hyprlock = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    extraConfig = ''
      hl.bind("SUPER + X", hl.dsp.exec_cmd("wlogout"))
    '';
  };
}
