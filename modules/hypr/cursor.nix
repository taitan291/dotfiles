{
  pkgs,
  lib,
  ...
}: {
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
      hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
      hl.env("XCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
      hl.env("HYPRCURSOR_SIZE", "24")
    '';
  };
}
