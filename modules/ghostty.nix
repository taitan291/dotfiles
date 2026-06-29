_: {
  programs.ghostty = {
    enable = true;
    settings = {
      # フォント設定
      font-family = "Hack Nerd Font";
      font-size = 14;
      # テーマ設定 (Ghosttyは標準で多数のテーマを内蔵)
      theme = "Catppuccin Mocha";
      # ウィンドウ・UI設定
      window-padding-x = 4;
      window-padding-y = 4;
      background-opacity = 1;
      # Hyprland(Wayland)等のタイリングWM環境向けの最適化
      window-decoration = false;
    };
  };
}
