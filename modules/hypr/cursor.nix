{pkgs, ...}: let
  cursorName = "miku-cursor-pkg";
  cursorSize = 24;
  miku-cursor-pkg = pkgs.stdenv.mkDerivation {
    pname = "hatsune-miku-windows-linux-cursors";
    version = "1.2.6";

    src = pkgs.fetchFromGitHub {
      owner = "supermariofps";
      repo = "hatsune-miku-windows-linux-cursors";
      rev = "814a5d731e121ccdeb374f29ea1464fbf56bc36d";
      sha256 = "sha256-OQjjOc9VnxJ7tWNmpHIMzNWX6WsavAOkgPwK1XAMwtE=";
    };
  };
in {
  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;

      package = miku-cursor-pkg;
      name = cursorName;
      size = cursorSize;
    };
    sessionVariables = {
      XCURSOR_THEME = cursorName;
      XCURSOR_SIZE = cursorSize;
      HYPRCURSOR_THEME = cursorName;
      HYPRCURSOR_SIZE = cursorSize;
    };
    file = {
      ".icons".source = "${miku-cursor-pkg}";
    };
  };

  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
    settings = {
      env = [
        #cursor
        "XCURSOR_THEME,${toString cursorName}"
        "XCURSOR_SIZE,${toString cursorSize}"
        "HYPRCURSOR_THEME,${toString cursorName}"
        "HYPRCURSOR_SIZE,${toString cursorSize}"
      ];

      extraConfig = ''
        env = HYPRCURSOR_THEME,${toString cursorName}
        env = HYPRCURSOR_SIZE,${toString cursorSize}
      '';

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
