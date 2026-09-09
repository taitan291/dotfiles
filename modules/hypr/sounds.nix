{pkgs, ...}: {
  services.swayosd.enable = true;

  wayland.windowManager.hyprland = {
    extraConfig = ''
      ${builtins.readFile ./config/sounds.lua}
    '';
  };
}
