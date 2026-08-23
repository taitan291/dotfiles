{...}: {
  home = {
    file = {
      "Pictures/Screenshots/.keep".text = "";
    };
  };
  programs.hyprshot = {
    enable = true;
  };
  # wayland.windowManager.hyprland.settings = {
  #   extraConfig = ''
  #     ${builtins.readFile ./config/shot.lua}
  #   '';
  # };
}
