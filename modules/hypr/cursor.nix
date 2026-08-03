{pkgs, ...}: {
  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;

      size = 24;
    };
  };

  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
    settings = {
      plugin = {
        dynamic-cursors = {
          enabled = true;
          mode = "tilt";
          shake = {
            enabled = true;
            threshold = 5.0; # 感度
            base = 4.0; # 拡大倍率のベース
            speed = 4.0; # 拡大スピード
            influence = 0.0; # 拡大時の中心位置への影響度
          };
          physics = {
            enabled = true;
            sensitivity = 1.0;
            communication = 0.8; # 動きの滑らかさ
          };
        };
      };
    };
  };
}
