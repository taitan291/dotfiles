{
  config,
  lib,
  pkgs,
  ...
}: let
  shotConfig =
    builtins.replaceStrings
    ["@SCREENSHOT_DIR@"]
    ["${config.home.homeDirectory}/Pictures/Screenshots"]
    (builtins.readFile ./config/shot.lua);
in {
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
      ${shotConfig}
    '';
  };
}
