{pkgs, ...}: {
  services.swayosd.enable = true;

  # wayland.windowManager.hyprland.settings = {
  #   extraConfig = ''
  #     ${builtins.readFile ./config/sounds.lua}
  #   '';
  # };
}
