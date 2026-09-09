{
  lib,
  pkgs,
  ...
}: {
  home = {
    file = {
      "Pictures/Screenshots/.keep".text = "";
    };
  };
  programs.hyprshot = {
    enable = true;
  };
  wayland.windowManager.hyprland = {
    extraConfig = ''
      hl.permission({
        binary = [[${lib.escapeRegex (lib.getExe pkgs.grim)}]],
        type = "screencopy",
        mode = "allow",
      })
      ${builtins.readFile ./config/shot.lua}
    '';
  };
}
