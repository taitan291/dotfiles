{
  pkgs,
  inputs,
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
    plugins = [
      dynamic-cursors
    ];
    extraConfig = ''
      hl.permission({
        binary = "${dynamic-cursors}/lib/libhypr-dynamic-cursors.so",
        type = "plugin",
        mode = "allow",
      })
      ${builtins.readFile ./config/plugin-cursors.lua}
    '';
  };
}
