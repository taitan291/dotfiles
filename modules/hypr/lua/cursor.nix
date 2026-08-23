{
  pkgs,
  inputs,
  ...
}: {
  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;

      size = 24;

      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hypr-dynamic-cursors.packages.${pkgs.stdenv.hostPlatform.system}.hypr-dynamic-cursors
    ];
    settings = {
      extraConfig = ''
        ${builtins.readFile ./config/plugin-cursors.lua}
      '';
    };
  };
}
