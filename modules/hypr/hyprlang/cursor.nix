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
      inputs.hypr-dynamic-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    settings = {
      plugin = {
        dynamic-cursors = {
          enabled = true;
          mode = "none";
          shake = {
            enabled = true;
            threshold = 4.0;
            base = 4.0;
            speed = 6.0;
            influence = 0.0;
            limit = 0.0;
            timeout = 2500;
          };
        };
      };
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic" # hyprcursorを使用する場合
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };
}
