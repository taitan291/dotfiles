{
  pkgs,
  inputs,
  lib,
  ...
}: let
  dynamic-cursors =
    inputs.hypr-dynamic-cursors.packages.${pkgs.stdenv.hostPlatform.system}.hypr-dynamic-cursors;
in {
  home = {
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;

      size = 24;

      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  wayland.windowManager.hyprland = {
    extraConfig = lib.mkAfter ''
      hl.permission({
        binary = "${dynamic-cursors}/lib/libhypr-dynamic-cursors.so",
        type = "plugin",
        mode = "allow",
      })
      hl.plugin.load("${dynamic-cursors}/lib/libhypr-dynamic-cursors.so")
      ${builtins.readFile ./config/plugin-cursors.lua}
    '';
  };
}
